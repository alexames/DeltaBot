# encoding: utf-8

"""
################################################################################
#                                                                              #
# Copyright 2013: Acebulf, alexames, PixelOrange, Snorrrlax, vaetrus, yaworsw  #
#                 and the moderators of http://www.reddit.com/r/changemyview   #
#                                                                              #
# This file is part of Deltabot sourcecode.                                    #
#                                                                              #
# Deltabot is free software: you can redistribute it and/or modify             #
# it under the terms of the GNU General Public License as published by         #
# the Free Software Foundation, either version 3 of the License, or            #
# (at your option) any later version.                                          #
#                                                                              #
# Deltabot is distributed in the hope that it will be useful,                  #
# but WITHOUT ANY WARRANTY; without even the implied warranty of               #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                #
# GNU General Public License for more details.                                 #
#                                                                              #
# You should have received a copy of the GNU General Public License            #
# along with Deltabot.  If not, see <http://www.gnu.org/licenses/>.            #
#                                                                              #
################################################################################
"""
from __future__ import print_function

import re
import os
import sys
import time
import praw
import logging
import calendar
import datetime
import traceback
import collections
import random


try:
    from HTMLParser import HTMLParser
except ImportError:  # Python 3
    from html.parser import HTMLParser

logging.getLogger('requests').setLevel(logging.WARNING)

def get_first_int(string):
    """ Returns the first integer in the string"""
    match = re.search('(\d+)', string)
    return int(match.group()) if match else 0


def flair_sorter(dic):
    """ Get numeric value from flair. """
    num = dic['flair_text']
    if num:
        return num
    else:
        return 0


def skippable_line(line):
    """ Returns true if the given line is a quote or code """
    return re.search('(^    |^ *&gt;)', line) is not None


def str_contains_token(text, tokens):
    """ Returns true if a given string contains one of the given tokens, as long
    as the token is not inside a quote or code block """
    lines = text.split('\n')
    in_quote = False
    for line in lines:
        if not line:  # Empty string
            in_quote = False
        if in_quote:
            continue
        if not skippable_line(line):
            for token in tokens:
                if token in line:
                    return True
        else:
            in_quote = True
    return False


def write_saved_id(filename, the_id):
    """ Write the previous comment's ID to file. """
    with open(filename, 'w') as _file:
        _file.write(the_id if the_id else "None")


def read_saved_id(filename):
    """ Get the last comment's ID from file. """
    logging.debug("Reading ID from file %s" % filename)
    try:
        with open(filename, 'r') as id_file:
            current = id_file.readline()
            if current == "None":
                current = None
        return current
    except IOError:
        return None


def markdown_to_scoreboard(text):
    scoreboard = {}
    for line in text.splitlines():
        if line[:2] == '##':
            tokens = line.split()
            username = tokens[1]
            score = int(tokens[2])
            current_user = scoreboard[username] = {"links": [], "score": score}
        elif line:
            current_user["links"].append(line[2:])
    return scoreboard


def scoreboard_to_markdown(scoreboard):
    join_list = []
    try:
        scoreboard_items = scoreboard.iteritems()
    except AttributeError:  # Python 3
        scoreboard_items = scoreboard.items()

    for key, value in scoreboard_items:
        join_list.append("## %s %s\n" % (key, value["score"]))
        for link in value["links"]:
            join_list.append("* %s\n" % link)
    return "\n".join(join_list)


def login_to_reddit(reddit, config):
    """
    Logs into reddit with the given config.
    """
    return reddit.login(config.account['username'], config.account['password'])


def get_longest_token_length(tokens):
    """
    Returns the length of the longest token within an iterable.
    Returns 0 if the list is empty or None
    """
    if tokens is None or len(tokens) == 0:
        return 0
    return len(max(tokens, key=lambda t: len(t)))


class DeltaBot(object):
    def __init__(self, config, reddit):
        self.config = config
        self.running = False
        self.reddit = reddit

        logging.info('Connecting to reddit...')
        login_to_reddit(self.reddit, self.config)
        logging.info("Logged in as %s" % self.config.account['username'])

        self.subreddit = self.reddit.get_subreddit(self.config.subreddit)
        self.comment_id_regex = '(?:http://)?(?:www\.)?reddit\.com/r(?:eddit)?/' + \
                                self.config.subreddit + '/comments/[\d\w]+(?:/[^/]+)/?([\d\w]+)'
        self.scanned_comments = collections.deque([], 10)

        most_recent_comment_id = read_saved_id(self.config.last_comment_filename)

        if most_recent_comment_id is not None:
            self.scanned_comments.append(most_recent_comment_id)

        self.changes_made = False
        self.minimum_comment_length = get_longest_token_length(self.config.tokens) + self.config.minimum_comment_length

    def send_first_time_message(self, recipient_name):
        first_time_message = self.config.private_message % (
            self.config.subreddit, recipient_name)
        self.reddit.send_message(recipient_name,
                                 "Congratulations on your first delta!",
                                 first_time_message)

    def get_message(self, message_key):
        """ Given a type of message select one of the messages from the
        configuration at random. """
        messages = self.config.messages[message_key]
        return random.choice(messages) + self.config.messages['append_to_all_messages']

    def string_matches_message(self, string, message_key, *args):
        messages = self.config.messages[message_key]
        for message in messages:
            appendation = self.config.messages['append_to_all_messages']
            full_message = (message % args) + appendation
            if string == full_message:
                return True
        return False

    def award_points(self, awardee, comment):
        """ Awards a point. """
        logging.info("Awarding point to %s" % awardee)
        self.adjust_point_flair(awardee)
        self.update_monthly_scoreboard(awardee, comment)
        self.update_wiki_tracker(comment)

    def get_scoreboard_for_date(self,date):
        """ Return the scoreboard appropriate for the given date"""
        page_title = "scoreboard_%s_%s" % (date.year, date.month)
        try:
            scoreboard_page = self.reddit.get_wiki_page(self.config.subreddit,
                                                        page_title)
            page_text = scoreboard_page.content_md
        except:
            page_text = ""
        return markdown_to_scoreboard(page_text)

    # Keeping this here for compatibility
    def get_this_months_scoreboard(self, date):
        return self.get_scoreboard_for_date(date)

    def update_monthly_scoreboard(self, redditor, comment, num_points=1):
        logging.info("Updating monthly scoreboard")
        date = datetime.datetime.utcfromtimestamp(comment.created)
        scoreboard = self.get_this_months_scoreboard(date)
        page_title = "scoreboard_%s_%s" % (date.year, date.month)
        if redditor in scoreboard:
            entry = scoreboard[redditor]
        else:
            entry = scoreboard[redditor] = {"links": [], "score": 0}

        entry["links"].append("[%s](%s)" % (comment.submission.title,
                                            comment.permalink))
        entry["score"] += num_points

        self.reddit.edit_wiki_page(self.config.subreddit, page_title,
                                   scoreboard_to_markdown(scoreboard),
                                   "Updating monthly scoreboard")

    def adjust_point_flair(self, redditor, num_points=1):
        """ Recalculate a user's score and update flair. """
        self.changes_made = True

        flair = self.subreddit.get_flair(redditor)
        if flair['flair_text'] == None:
            points = 0
            css_class = ''
            self.send_first_time_message(redditor)
        elif flair:
            points = get_first_int(flair['flair_text'])
            css_class = flair['flair_css_class']
        else:
            points = 0
            css_class = ''
            self.send_first_time_message(redditor)

        points += num_points
        if self.config.flair['css_class'] not in css_class:
            css_class += ' ' + self.config.flair['css_class']

        self.subreddit.set_flair(redditor,
                                 self.config.flair['point_text'] % points,
                                 css_class)

    def is_comment_too_short(self, comment):
        return len(comment.body) < self.minimum_comment_length

    def already_replied(self, comment, test=False):
        """ Returns true if Deltabot has replied to this comment """
        replies = comment.replies

        # Needed in order to refresh comments
        if not test:
            replies = self.reddit.get_submission(comment.permalink).comments[0].replies

        message = self.get_message('confirmation')
        for reply in replies:
            author = str(reply.author).lower()
            me = self.config.account['username'].lower()
            if author == me:
                if str(message)[0:15] in str(reply):
                    return True
                else:
                    reply.delete()
                    return False
        return False

    def is_parent_commenter_author(self, comment, parent):
        """ Returns true if the author of the parent comment the submitter """
        comment_author = parent.author
        post_author = comment.submission.author
        return comment_author == post_author

    def points_awarded_to_children(self, awardee, comment, confirm_msg=None, me=None):
        """ Returns True if the OP awarded a delta to this comment or any of its
        children, by looking for confirmation messages from this bot. """

        if confirm_msg is None:
            confirm_msg = (self.get_message('confirmation')
                           % (awardee, self.config.subreddit, awardee))
        if me is None:
            me = self.config["account"]["username"]

        # If this is a confirmation message, return True now
        if comment.author == me and confirm_msg in comment.body:
            return True
        # Otherwise, recurse
        for reply in comment.replies:
            if self.points_awarded_to_children(awardee, reply, confirm_msg, me):
                return True
        return False

    def points_already_awarded_to_ancestor(self, comment, parent):
        awardee = parent.author
        # First, traverse to root comment
        root = parent
        while not root.is_root:
            root = self.reddit.get_info(thing_id=root.parent_id)
        # Then, delegate to the recursive function above
        return self.points_awarded_to_children(awardee, root)

    # Functions with side effects are passed in as arguments
    # When testing, these can be replaced with mocks or "dummy functions"
    def scan_comment(self, comment, parent,
                     check_already_replied,
                     check_is_parent_commenter_author,
                     check_points_already_awarded_to_ancestor,
                     strict=True):
        logging.info("Scanning comment reddit.com/r/%s/comments/%s/c/%s by %s" %
                     (self.config.subreddit, comment.submission.id, comment.id,
                      comment.author.name if comment.author else "[deleted]"))

        # Logs describing the output will be returned so they can be used for testing
        log = ""
        message = None
        awardee = None

        if str_contains_token(comment.body, self.config.tokens) or not strict:
            parent_author = str(parent.author.name).lower()
            comment_author = str(comment.author.name).lower()
            me = self.config.account['username'].lower()
            if parent_author == me:
                log = "No points awarded, replying to DeltaBot"

            elif parent_author == comment_author:
                log = "No points awarded, user replied to self"

            elif check_already_replied(comment):
                log = "No points awarded, already replied"

            elif strict and check_is_parent_commenter_author(comment, parent):
                log = "No points awarded, parent is OP"
                message = self.get_message('broken_rule')

            elif strict and check_points_already_awarded_to_ancestor(comment, parent):
                log = "No points awarded, already awarded"
                message = self.get_message('already_awarded') % parent.author

            elif strict and self.is_comment_too_short(comment):
                log = "No points awarded, too short"
                message = self.get_message('too_little_text') % parent.author

            else:
                awardee = parent.author.name
                message = self.get_message('confirmation') % (parent.author,
                                                              self.config.subreddit, parent.author)
        else:
            log = "No points awarded, comment does not contain Delta"

        return log, message, awardee

    # Wrapper function to keep side effects out of scan_comments
    def scan_comment_wrapper(self, comment, strict=True):
        parent = self.reddit.get_info(thing_id=comment.parent_id)

        log, message, awardee = self.scan_comment(comment, parent,
                                                  self.already_replied,
                                                  self.is_parent_commenter_author,
                                                  self.points_already_awarded_to_ancestor,
                                                  strict)
        logging.info(log)

        if message:
            comment.reply(message).distinguish()

        if awardee:
            self.award_points(awardee, comment)

    def get_most_recent_comment(self):
        """Finds the most recently scanned comment,
        so we know where to begin the next scan"""

        most_recent_comment_id = None
        while self.scanned_comments:
            comment = self.reddit.get_info(thing_id=self.scanned_comments[-1])
            if comment is not None:
				if comment.body == '[deleted]':
					self.scanned_comments.pop()
				else:
					most_recent_comment_id = self.scanned_comments[-1]
					break
            else:
				most_recent_comment_id = self.scanned_comments[-1]
				break

        return most_recent_comment_id

    def scan_comments(self):
        """ Scan a given list of comments for tokens. If a token is found,
        award points. """
        logging.info("Scanning new comments")

        fresh_comments = self.subreddit.get_comments(params={'before': self.get_most_recent_comment()},
                                                     limit=None)

        for comment in fresh_comments:
            self.scan_comment_wrapper(comment)
            if not self.scanned_comments or comment.name > self.scanned_comments[-1]:
                self.scanned_comments.append(comment.name)

    def command_add(self, message_body, strict):
        ids = re.findall(self.comment_id_regex, message_body)
        for id in ids:
            comment = self.reddit.get_info(thing_id='t1_%s' % id)
            if type(comment) is praw.objects.Comment:
                self.scan_comment_wrapper(comment, strict=strict)

    def is_moderator(self, name):
        moderators = self.reddit.get_moderators(self.config.subreddit)
        mod_names = [mod.name for mod in moderators]
        return name in mod_names

    def scan_message(self, message):
        logging.info("Scanning message %s from %s" % (message.name,
                                                      message.author))
        if self.is_moderator(message.author.name):
            command = message.subject.lower()
            if command == "force add":
                self.reddit.send_message("/r/" + self.config.subreddit,
                                         "Force Add Detected",
                                         "The Force Add command has been used "
                                         "on the following link(s):\n\n" + \
                                         message.body)
            if command == "add" or command == "force add":
                strict = (command != "force add")
                self.command_add(message.body, strict)
                self.reddit.send_message(message.author,
                                         "Add complete",
                                         "The add command has been "
                                         "completed on: " + message.body)

            elif command == "remove":
                # Todo
                pass

            elif command == "rescan":
                self.rescan_comments(message.body)

            elif command == "reset":
                self.scanned_comments.clear()

            elif command == "stop":
                self.reddit.send_message("/r/" + self.config.subreddit,
                                         "Stop Message Confirmed",
                                         "NOTICE: The stop message has been "
                                         "issued and I have stopped running.")
                logging.warning("The stop command has been issued. If this was "
                                "not sent by you, please check as to why before"
                                " restarting.")
                message.mark_as_read()
                os._exit(1)

    def rescan_comment(self, bots_comment, orig_comment, awardees_comment):
        """Rescan comments that were too short"""
        awardee = awardees_comment.author.name

        if (self.string_matches_message(bots_comment.body, 'too_little_text',
                                        awardee)
            and not self.is_comment_too_short(orig_comment)
            and not self.is_parent_commenter_author(orig_comment, awardees_comment)
            and not self.points_already_awarded_to_ancestor(orig_comment, awardees_comment)):
            self.award_points(awardee, orig_comment)
            message = self.get_message('confirmation') % (
                awardee, self.config.subreddit, awardee
            )
            bots_comment.edit(message).distinguish()

    # Keeps side effects out of rescan_comment to make testing easier
    def rescan_comment_wrapper(self, bots_comment):
        orig_comment = self.reddit.get_info(thing_id=bots_comment.parent_id)
        awardees_comment = self.reddit.get_info(thing_id=orig_comment.parent_id)

        self.rescan_comment(bots_comment, orig_comment, awardees_comment)

    def rescan_comments(self, message_body):
        comment_ids = re.findall(self.comment_id_regex, message_body)
        for comment_id in comment_ids:
            comment = self.reddit.get_info(thing_id='t1_%s' % comment_id)
            if type(comment) is praw.objects.Comment:
                self.rescan_comment_wrapper(comment)

    def scan_comment_reply(self, comment):
        logging.info("Scanning comment reply from %s" % comment.author.name)

        bots_comment = self.reddit.get_info(thing_id=comment.parent_id)
        orig_comment = self.reddit.get_info(thing_id=bots_comment.parent_id)

        valid_commenter = (comment.author
                           and (comment.author == orig_comment.author
                                or self.is_moderator(comment.author.name)))

        if valid_commenter:
            self.rescan_comment_wrapper(bots_comment)

    def scan_inbox(self):
        """ Scan a given list of messages for commands. If no list arg,
        then get newest comments from the inbox. """
        logging.info("Scanning inbox")

        messages = self.reddit.get_unread(unset_has_mail=True)

        for message in messages:
            if type(message) == praw.objects.Comment:
                self.scan_comment_reply(message)
            elif type(message) == praw.objects.Message:
                self.scan_message(message)

            message.mark_as_read()

    def scan_mod_mail(self):
        pass

    def update_top_ten_css(self):
        """ Update the flair css for the top ten users """
        today = datetime.datetime.utcnow()
        top_1_css = self.config.flair['top1']
        top_10_css = self.config.flair['top10']
        top_scores = self.get_top_ten_scores_for_date(today)

        ### Remove special css classes from last month
        last_month = datetime.datetime(day=1,month=today.month,year=today.year) - datetime.timedelta(days=1)
        last_month_scores = self.get_top_ten_scores_for_date(last_month)
        for score in last_month_scores:
            redditor = score['user']
            flair = self.subreddit.get_flair(redditor)
            flair_text = flair['flair_text']
            current_css = flair['flair_css_class']
            print(redditor)
            print(flair)
            print(flair_text)
            print(current_css)
            stuff = raw_input("Wait")
            new_css = current_css.replace(top_1_css, '').replace(top_10_css, '').strip()
            self.subreddit.set_flair(redditor,flair_text=flair_text,flair_css_class=new_css)

        ### Remove special css classes from this month
        ### so that changes are reflected on every update
        for score in top_scores:
            redditor = score['user']
            flair = self.subreddit.get_flair(redditor)
            flair_text = flair['flair_text'] 
            current_css = flair['flair_css_class']
            new_css = current_css.replace(top_1_css, '').replace(top_10_css, '').strip()
            self.subreddit.set_flair(redditor,flair_text=flair_text,flair_css_class=new_css)

        ### Set special css class for top user
        top_redditor = top_scores[0]['user']
        flair = self.subreddit.get_flair(redditor)
        flair_text = flair['flair_text'] 
        top_1_current = flair['flair_css_class']
        if top_1_css not in top_1_current:
            new_css = '{0} {1}'.format(top_1_current, top_1_css)
            self.subreddit.set_flair(top_redditor,flair_text=flair_text,flair_css_class=new_css)

        ### Set special css class for top 2-10 users
        for i in range(1, 10):
            redditor = top_scores[i]['user']
            flair = self.subreddit.get_flair(redditor)
            flair_text = flair['flair_text'] 
            current_css = flair['flair_css_class']
            if top_10_css not in current_css:
                new_css = '{0} {1}'.format(current_css,top_10_css)
                self.subreddit.set_flair(redditor,flair_text=flair_text,flair_css_class=new_css)

    def update_scoreboard(self):
        """ Update the top 10 list with highest scores. """
        logging.info("Updating scoreboard")
        self.update_top_ten_css()
        now = datetime.datetime.utcnow()
        top_scores = self.get_top_ten_scores_for_date(now)
        score_table = [
            "\n\n# Top Ten Viewchangers (%s)" % calendar.month_name[now.month],
            self.config.scoreboard['table_head'],
            self.config.scoreboard['table_leader_entry'] % (
                top_scores[0]['user'], top_scores[0]['flair_text'],
                self.config.subreddit, top_scores[0]['user']
            )
        ]

        for i in range(1, 10):
            flair_texts = self.subreddit.get_flair(top_scores[i]['user'])
            total_deltas = int(flair_texts["flair_text"][:-1])
            table_entry = self.config.scoreboard['table_entry'] % (
                i + 1, top_scores[i]['user'], top_scores[i]['flair_text'],
                total_deltas,self.config.subreddit, top_scores[i]['user']
            )
            score_table.append(table_entry)

        settings = self.subreddit.get_settings()
        old_desc = settings['description']
        # IMPORTANT: this splits the description on the _____ token.
        # Don't use said token for anything other than dividing sections
        # or else this breaks.
        split_desc = old_desc.split("_____")
        split_desc[len(split_desc) - 1] = "".join(score_table)
        new_desc = ""
        for section in split_desc:
            if section != split_desc[0]:
                new_desc = new_desc + "_____" + section.replace("&amp;", "&")
        self.subreddit.update_settings(description=new_desc)
        self.changes_made = False

    def get_top_ten_scores(self):
        """ Get a list of the top 10 scores. """
        flair_list = [f for f in self.subreddit.get_flair_list(limit=None)]
        flair_list = sorted(flair_list, key=flair_sorter)
        flair_list.reverse()
        while len(flair_list) < 10:
            flair_list.append({'user': 'none', 'flair_text': 'no score'})
        return flair_list[0:10]

    def get_top_ten_scores_for_date(self,date):
        """ Get a list of the top 10 scores for the given month """
        scoreboard = self.get_scoreboard_for_date(date)
        score_list = []
        for user, value in scoreboard.iteritems():
            score_list.append({
                'user': user,
                'flair_text': value['score']
            })
        score_list = sorted(score_list, key=flair_sorter)
        score_list.reverse()
        while len(score_list) < 10:
            score_list.append({'user': 'none', 'flair_text': 'no score'})
        return score_list[0:10]

    def get_top_ten_scores_this_month(self):
        """ Get a list of the top 10 scores this month """
        date = datetime.datetime.utcnow()
        return get_top_ten_scores_for_date(date)

    def update_wiki_tracker(self, comment):
        """ Update wiki page of person earning the delta

            Note: comment passed in is the comment awarding the delta,
            parent comment is the one earning the delta
        """
        logging.info("Updating wiki")

        comment_url = comment.permalink
        submission_url = comment.submission.permalink
        submission_title = comment.submission.title
        parent = self.reddit.get_info(thing_id=comment.parent_id)
        parent_author = parent.author.name
        author_flair = str(self.subreddit.get_flair(parent_author))
        author_flair = re.search("(flair_text': u')(\d*)", author_flair)
        flair_count = "0 deltas"
        if author_flair:
            flair_count = author_flair.group(2)
            if flair_count == "1":
                flair_count = "1 delta"
            else:
                flair_count += " deltas"
        awarder_name = comment.author.name
        today = datetime.date.today()

        # try to get wiki page for user, throws exception if page doesn't exist
        try:
            user_wiki_page = self.reddit.get_wiki_page(self.config.subreddit,
                                                       "user/" + parent_author)

            # get old wiki page content as markdown string, and unescaped any
            # previously escaped HTML characters
            old_content = HTMLParser().unescape(user_wiki_page.content_md)

            # Alter how many deltas is in the first line
            try:
                old_content = re.sub("([0-9]+) delta[s]?", flair_count,
                                     old_content)
            except:
                print("The 'has received' line in the wiki has failed to update.")
            # compile regex to search for current link formatting
            # only matches links that are correctly formatted, so will not be
            # broken by malformed or links made by previous versions of DeltaBot
            regex = re.compile("\\* \\[%s\\]\\(%s\\) \\(\d+\\)" % (
                re.escape(submission_title), re.escape(submission_url)
            ))
            # search old page content for link
            old_link = regex.search(old_content)

            # variable for updated wiki content
            new_content = ""

            # old link exists, only increase number of deltas for post
            if old_link:
                # use re.sub to increment number of deltas in link
                new_link = re.sub(
                    "\((\d+)\)",
                    lambda match: "(" + str(int(match.group(1)) + 1) + ")",
                    old_link.group(0)
                )

                # insert link to new delta
                new_link += "\n    1. [Awarded by /u/%s](%s) on %s/%s/%s" % (
                    awarder_name, comment_url + "?context=2",
                    today.month, today.day, today.year
                )

                #use re.sub to replace old link with new link
                new_content = re.sub(regex, new_link, old_content)

            # no old link, create old link with initial count of 1
            else:
                # create link and format as markdown list item
                # "?context=2" means link shows comment earning the delta and
                # the comment awarding it
                # "(1)" is the number of deltas earned from that comment
                # (1 because this is the first delta the user has earned)
                add_link = "\n\n* [%s](%s) (1)\n    1. [Awarded by /u/%s](%s) on %s/%s/%s" % (submission_title,
                                                                                              submission_url,
                                                                                              awarder_name,
                                                                                              comment_url + "?context=2",
                                                                                              today.month,
                                                                                              today.day,
                                                                                              today.year)

                # get previous content as markdown string and append new content
                new_content = user_wiki_page.content_md + add_link

            # overwrite old content with new content
            self.reddit.edit_wiki_page(self.config.subreddit,
                                       user_wiki_page.page,
                                       new_content,
                                       "Updated delta links.")

        # if page doesn't exist, create page with initial content
        except:

            # create header for new wiki page
            initial_text = "/u/%s has received 1 delta for the following comments:" % parent_author

            # create link and format as markdown list item
            # "?context=2" means link shows comment earning the delta and the comment awarding it
            # "(1)" is the number of deltas earned from that comment
            # (1 because this is the first delta the user has earned)
            add_link = "\n\n* [%s](%s) (1)\n    1. [Awarded by /u/%s](%s) on %s/%s/%s" % (submission_title,
                                                                                          submission_url,
                                                                                          awarder_name,
                                                                                          comment_url + "?context=2",
                                                                                          today.month, today.day,
                                                                                          today.year)

            # combine header and link
            full_update = initial_text + add_link

            # write new content to wiki page
            self.reddit.edit_wiki_page(self.config.subreddit,
                                       "user/" + parent_author,
                                       full_update,
                                       "Created user's delta links page.")

            """Add new awardee to Delta Tracker wiki page"""

            # get delta tracker wiki page
            delta_tracker_page = self.reddit.get_wiki_page(
                self.config.subreddit,
                "delta_tracker")

            # retrieve delta tracker page content as markdown string
            delta_tracker_page_body = delta_tracker_page.content_md

            # create link to user's wiki page as markdown list item
            new_link = "\n\n* /u/%s -- [Delta List](/r/%s/wiki/%s)" % (
                parent_author,
                self.config.subreddit,
                parent_author)

            # append new link to old content
            new_content = delta_tracker_page_body + new_link

            # overwrite old page content with new page content
            self.reddit.edit_wiki_page(self.config.subreddit,
                                       "delta_tracker",
                                       new_content,
                                       "Updated tracker page.")

    def go(self):
        """ Start DeltaBot. """
        self.running = True
        reset_counter = 0
        while self.running:
            old_comment_id = self.scanned_comments[-1] if self.scanned_comments else None
            logging.info("Starting iteration at %s" % old_comment_id or "None")

            try:
                self.scan_inbox()
                self.scan_mod_mail()
                self.scan_comments()
                if self.changes_made:
                    self.update_scoreboard()
            except:
                print("Exception in user code:")
                print('-' * 60)
                traceback.print_exc(file=sys.stdout)
                print('-' * 60)

            if self.scanned_comments and old_comment_id is not self.scanned_comments[-1]:
                write_saved_id(self.config.last_comment_filename,
                               self.scanned_comments[-1])

            logging.info("Iteration complete at %s" % (self.scanned_comments[-1] if
                                                       self.scanned_comments else "None"))
            reset_counter += + 1
            print("Reset Counter at %s." % reset_counter)
            print("When this reaches 10, the script will clear its history.")
            if reset_counter == 10:
                self.scanned_comments.clear()
                reset_counter = 0
            logging.info("Sleeping for %s seconds" % self.config.sleep_time)
            time.sleep(self.config.sleep_time)
