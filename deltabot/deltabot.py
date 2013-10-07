# encoding: utf-8


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


import re
import sys
import time
import praw
import logging
import calendar
import datetime
import traceback
from HTMLParser import HTMLParser
import collections
from random import choice


logging.getLogger('requests').setLevel(logging.WARNING)


def get_first_int(string):
    """ Returns the first integer in the string"""
    match = re.search('(\d+)', string)
    return int(match.group()) if match else 0


def flair_sorter(dic):
    """ Get numeric value from flair. """
    num = dic['flair_text']
    if num:
        return get_first_int(num)
    else:
        return 0


def skippable_line(line):
    """ Returns true if the given line is a quote or code """
    return re.search('(^    |^ *&gt;)', line) != None


def str_contains_token(text, tokens):
    """ Returns true if a given string contains one of the given tokens, as long
    as the token is not inside a quote or code block """
    lines = text.split('\n')
    for line in lines:
        if not skippable_line(line):
            for token in tokens:
                if token in line:
                    return True
    return False


def write_saved_id(filename, the_id):
    """ Write the previous comment's ID to file. """
    logging.debug("Saving ID %s to file %s" % (the_id, filename))
    id_file = open(filename, 'w')
    id_file.write(the_id if the_id else "None")
    id_file.close()


def read_saved_id(filename):
    """ Get the last comment's ID from file. """
    logging.debug("Reading ID from file %s" % filename)
    try:
        id_file = open(filename, 'r')
        current = id_file.readline()
        if current == "None":
            current = None
        id_file.close()
        return current
    except IOError:
        return None


def markdown_to_scoreboard(text):
    scoreboard = {}
    for line in text.split('\n'):
        if line[:2] == '##':
            tokens = line.split()
            username = tokens[1]
            score = int(tokens[2])
            current_user = scoreboard[username] = { "links": [], "score": score }
        elif line:
            current_user["links"].append(line[2:])
    return scoreboard


def scoreboard_to_markdown(scoreboard):
    text = ""
    for key, value in scoreboard.iteritems():
        text += "## %s %s\n" % (key, value["score"])
        for link in value["links"]:
            text += "* %s\n" % link
        text += "\n"
    return text


class DeltaBot(object):
    def __init__(self, config):
        logging.info('connecting to reddit')
        self.config = config
        self.reddit = praw.Reddit(self.config.subreddit + ' bot',
                                  site_name=config.site_name)
        self.reddit.login(*[self.config.account['username'],
                          self.config.account['password']])
        self.subreddit = self.reddit.get_subreddit(self.config.subreddit)
        self.comment_id_regex = '(?:http://)?(?:www\.)?reddit\.com/r(?:eddit)?/' + self.config.subreddit + '/comments/[\d\w]+(?:/[^/]+)/?([\d\w]+)'
        self.before = collections.deque([], 10)
        before_id = read_saved_id(self.config.last_comment_filename)
        if before_id:
            self.before.append(before_id)
        self.changes_made = False
        longest = 0
        for token in self.config.tokens:
            if len(token) > longest:
                longest = len(token)
        self.minimum_comment_length = longest + self.config.minimum_comment_length

    def send_first_time_message(self, recipient_name):
        self.reddit.send_message(recipient_name, "Congratulations on your first delta!", self.config.private_message)

    def get_message(self, message_key):
        """ Given a type of message select one of the messages from the
        configuration at random. """
        messages = self.config.messages[message_key]
        return choice(messages) + self.config.messages['append_to_all_messages']


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


    def get_this_months_scoreboard(self, date):
        page_title = "scoreboard_%s_%s" % (date.year, date.month)
        try:
            scoreboard_page = self.reddit.get_wiki_page(self.config.subreddit,
                                                        page_title)
            page_text = scoreboard_page.content_md
        except:
            page_text = ""
        return markdown_to_scoreboard(page_text)


    def update_monthly_scoreboard(self, redditor, comment, num_points=1):
        logging.info("Updating monthly scoreboard")
        date = datetime.datetime.utcfromtimestamp(comment.created)
        scoreboard = self.get_this_months_scoreboard(date)
        page_title = "scoreboard_%s_%s" % (date.year, date.month)
        if redditor in scoreboard:
            entry = scoreboard[redditor]
        else:
            entry = scoreboard[redditor] = { "links": [], "score": 0 }

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
        if flair:
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


    def already_replied(self, comment):
        """ Returns true if Deltabot has replied to this comment """
        comment = self.reddit.get_submission(comment.permalink).comments[0]
        for reply in comment.replies:
            author = str(reply.author).lower()
            me = self.config.account['username'].lower()
            if author == me:
                return True;
        return False


    def is_parent_commenter_author(self, comment):
        """ Returns true if the author of the parent comment the submitter """
        comment_author = self.reddit.get_info(thing_id=comment.parent_id).author
        post_author = comment.submission.author
        return comment_author == post_author


    def points_already_awarded_to_ancestor(self, comment):
        """ Returns true if a point was awarded by the comment's author already
        in this branch of the comment tree """
        parent = self.reddit.get_info(thing_id=comment.parent_id)
        awarder = comment.author
        awardee = parent.author
        while not comment.is_root:
            comment = self.reddit.get_info(thing_id=comment.parent_id)
            parent = self.reddit.get_info(thing_id=comment.parent_id)

            if (comment.author == awarder
                and parent.author == awardee
                and str_contains_token(comment.body, self.config.tokens)):
                return True

        return False


    def scan_comment(self, comment, strict=True):
        logging.info("Scanning comment reddit.com/r/%s/comments/%s/c/%s by %s" %
                     (self.config.subreddit, comment.submission.id, comment.id,
                      comment.author.name if comment.author else "[deleted]"))

        if str_contains_token(comment.body, self.config.tokens) or not strict:
            parent = self.reddit.get_info(thing_id=comment.parent_id)
            parent_author = str(parent.author.name).lower()
            me = self.config.account['username'].lower()
            if parent_author == me:
                logging.info("No points awarded, replying to DeltaBot")

            elif self.already_replied(comment):
                logging.info("No points awarded, already replied")

            elif strict and self.is_parent_commenter_author(comment):
                logging.info("No points awarded, parent is OP")
                message = self.get_message('broken_rule')
                comment.reply(message).distinguish()

            elif strict and self.points_already_awarded_to_ancestor(comment):
                logging.info("No points awarded, already awarded")
                message = self.get_message('already_awarded') % parent.author
                comment.reply(message).distinguish()

            elif strict and self.is_comment_too_short(comment):
                logging.info("No points awarded, too short")
                message = self.get_message('too_little_text') % parent.author
                comment.reply(message).distinguish()

            else:
                self.award_points(parent.author.name, comment)
                message = self.get_message('confirmation') % (parent.author,
                    self.config.subreddit, parent.author)
                comment.reply(message).distinguish()


    def scan_comments(self):
        """ Scan a given list of comments for tokens. If a token is found,
        award points. """
        logging.info("Scanning new comments")

        before_id = None
        while self.before:
            comment = self.reddit.get_info(thing_id=self.before[-1])
            if comment.body == '[deleted]':
                self.before.pop()
            else:
                before_id = self.before[-1]
                break

        for comment in self.subreddit.get_comments(params={'before': before_id},
                                                   limit=None):
            self.scan_comment(comment)
            if not self.before or comment.name > self.before[-1]:
                self.before.append(comment.name)


    def command_add(self, message_body, strict):
        ids = re.findall(self.comment_id_regex, message_body)
        for id in ids:
            comment = self.reddit.get_info(thing_id='t1_%s' % id)
            if type(comment) is praw.objects.Comment:
                self.scan_comment(comment, strict=strict)


    def is_moderator(self, name):
        moderators = self.reddit.get_moderators(self.config.subreddit)
        mod_names = [mod.name for mod in moderators]
        return name in mod_names


    def scan_message(self, message):
        logging.info("Scanning message %s from %s" % (message.name,
                                                      message.author))
        if self.is_moderator(message.author.name):
            command = message.subject.lower()
            if command == "add" or command == "force add":
                strict = (command != "force add")
                self.command_add(message.body, strict)

            elif command == "remove":
                # Todo
                pass

            elif command == "rescan":
                self.rescan_comments(message.body)

            elif command == "reset":
                self.before.clear()

            elif command == "stop":
                self.running = False


    def rescan_comment(self, bots_comment):
        orig_comment = self.reddit.get_info(thing_id=bots_comment.parent_id)
        awardees_comment = self.reddit.get_info(thing_id=orig_comment.parent_id)
        awardee = awardees_comment.author.name

        if (self.string_matches_message(bots_comment.body, 'too_little_text',
                                        awardee)
                and not self.is_comment_too_short(orig_comment)
                and not self.is_parent_commenter_author(orig_comment)
                and not self.points_already_awarded_to_ancestor(orig_comment)):
            self.award_points(awardee, orig_comment)
            message = self.get_message('confirmation')
            bots_comment.edit(message % awardee).distinguish()


    def rescan_comments(self, message_body):
        ids = re.findall(self.comment_id_regex, message_body)
        for id in ids:
            comment = self.reddit.get_info(thing_id='t1_%s' % id)
            if type(comment) is praw.objects.Comment:
                self.rescan_comment(comment)


    def scan_comment_reply(self, comment):
        logging.info("Scanning comment reply from %s" % comment.author.name)

        bots_comment = self.reddit.get_info(thing_id=comment.parent_id)
        orig_comment = self.reddit.get_info(thing_id=bots_comment.parent_id)

        valid_commenter = (comment.author
                           and (comment.author == orig_comment.author
                                or self.is_moderator(comment.author.name)))

        if valid_commenter:
            self.rescan_comment(bots_comment)


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


    def update_scoreboard(self):
        """ Update the top 10 list with highest scores. """
        logging.info("Updating scoreboard")
        now = datetime.datetime.utcnow()
        top_scores = self.get_top_ten_scores_this_month()
        score_table = [
            "\n\n# Top Ten Viewchangers (%s)" % calendar.month_name[now.month],
            self.config.scoreboard['table_head'],
            self.config.scoreboard['table_leader_entry'] % (top_scores[0]['user'],
            top_scores[0]['flair_text'], self.config.subreddit, top_scores[0]['user'])
        ]

        for i in range(1, 10):
            table_entry = self.config.scoreboard['table_entry'] % (i+1, top_scores[i]['user'],
                 top_scores[i]['flair_text'], self.config.subreddit, top_scores[i]['user'])
            score_table.append(table_entry)

        settings = self.subreddit.get_settings()
        old_desc = settings['description']
        # IMPORTANT: this splits the description on the _____ token.
        # Don't use said token for anything other than dividing sections
        # or else this breaks.
        split_desc = old_desc.split("_____")
        split_desc[len(split_desc)-1] = "".join(score_table)
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


    def get_top_ten_scores_this_month(self):
        """ Get a list of the top 10 scores this month """
        date = datetime.datetime.utcnow()
        scoreboard = self.get_this_months_scoreboard(date)
        score_list = []
        for user, value in scoreboard.iteritems():
            score_list.append({
                'user': user,
                'flair_text': self.config.flair['point_text'] % value['score']
            })
        score_list = sorted(score_list, key=flair_sorter)
        score_list.reverse()
        while len(score_list) < 10:
            score_list.append({'user': 'none', 'flair_text': 'no score'})
        return score_list[0:10]


    def update_wiki_tracker(self, comment):
        """ Update wiki page of person earning the delta
        
            Note: comment passed in is the comment awarding the delta, parent comment is the one earning the delta
        """
        comment_url = comment.permalink
        submission_url = comment.submission.permalink
        submission_title = comment.submission.title
        parent = self.reddit.get_info(thing_id=comment.parent_id)
        parent_author = parent.author.name.lower()
        awarder_name = comment.author.name.lower()
        today = datetime.date.today()
        
        # try to get wiki page for user, throws exception if page doesn't exist
        try:
            user_wiki_page = self.reddit.get_wiki_page(self.config.subreddit,
                                                    parent_author)

            # get old wiki page content as markdown string, and unescaped an previously escaped HTML characters
            old_content = HTMLParser().unescape(user_wiki_page.content_md)
            
            # compile regex to search for current link formatting
            # only matches links that are correctly formatted, so will not be broken by malformed or links made by previous versions of DeltaBot
            regex = re.compile("\\* \\[%s\\]\\(%s\\) \\(\d+\\)" % (re.escape(submission_title), re.escape(submission_url)))
            
            # search old page content for link
            old_link = regex.search(old_content)
            
            # variable for updated wiki content
            new_content = ""
            
            # old link exists, only increase number of deltas for post
            if old_link:
                # use re.sub to increment number of deltas in link
                new_link = re.sub("\((\d+)\)", lambda match: "(" + str(int(match.group(1)) + 1) + ")", old_link.group(0))
                
                # insert link to new delta
                new_link += "\n\n    1. [Awarded by %s](%s) on %s/%s/%s" % (awarder_name, 
                                                                            comment_url + "?context=2", 
                                                                            today.month, today.day, today.year)
                
                #use re.sub to replace old link with new link
                new_content = re.sub(regex, new_link, old_content)
                
            # no old link, create old link with initial count of 1
            else:
                # create link and format as markdown list item
                # "?context=2" means link shows comment earning the delta and the comment awarding it
                # "(1)" is the number of deltas earned from that comment (1 because this is the first delta the user has earned)
                add_link = "\n\n* [%s](%s) (1)\n\n    1. [Awarded by %s](%s) on %s/%s/%s" % (submission_title, 
                                                                                             submission_url, 
                                                                                             awarder_name, 
                                                                                             comment_url + "?context=2", 
                                                                                             today.month, today.day, today.year)
                 
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
            initial_text = "/u/%s has received deltas for the following comments:" % parent_author
            
            # create link and format as markdown list item
            # "?context=2" means link shows comment earning the delta and the comment awarding it
            # "(1)" is the number of deltas earned from that comment (1 because this is the first delta the user has earned)
            add_link = "\n\n* [%s](%s) (1)\n\n    1. [Awarded by %s](%s) on %s/%s/%s" % (submission_title, 
                                                                                         submission_url, 
                                                                                         awarder_name, 
                                                                                         comment_url + "?context=2", 
                                                                                         today.month, today.day, today.year)
            
            # combine header and link
            full_update = initial_text + add_link
            
            # write new content to wiki page
            self.reddit.edit_wiki_page(self.config.subreddit,
                                       parent_author,
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
        while self.running:
            old_before_id = self.before[-1] if self.before else None
            logging.info("Starting iteration at %s" % old_before_id or "None")

            try:
                self.scan_inbox()
                self.scan_mod_mail()
                self.scan_comments()
                if self.changes_made:
                    self.update_scoreboard()
            except:
                print "Exception in user code:"
                print '-'*60
                traceback.print_exc(file=sys.stdout)
                print '-'*60

            if self.before and old_before_id is not self.before[-1]:
                write_saved_id(self.config.last_comment_filename,
                               self.before[-1])

            logging.info("Iteration complete at %s" % (self.before[-1] if
                                                       self.before else "None"))
            logging.info("Sleeping for %s seconds" % self.config.sleep_time)
            time.sleep(self.config.sleep_time)
