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
import time
import praw
import logging
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
        if current is "None":
            current = None
        id_file.close()
        return current
    except IOError:
        return None


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
        self.before.append(read_saved_id(self.config.last_comment_filename))
        self.changes_made = False
        longest = 0
        for token in self.config.tokens:
            if len(token) > longest:
                longest = len(token)
        self.minimum_comment_length = longest + self.config.minimum_comment_length


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
        self.add_points(awardee)
        self.update_wiki_tracker(comment)


    def add_points(self, redditor, num_points=1):
        """ Recalculate a user's score and update flair. """
        self.changes_made = True

        flair = self.subreddit.get_flair(redditor)
        if flair:
            points = get_first_int(flair['flair_text'])
            css_class = flair['flair_css_class']
        else:
            points = 0
            css_class = ''

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
                message = self.get_message('confirmation') % parent.author
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


    def scan_message(self, message):
        logging.info("Scanning message %s from %s" % (message.name,
                                                      message.author))
        moderators = self.reddit.get_moderators(self.config.subreddit)
        mod_names = [mod.name for mod in moderators]
        if message.author.name in mod_names:
            command = message.subject.lower()
            if command == "add" or command == "force add":
                strict = (command != "force add")
                self.command_add(message.body, strict)

            elif command == "remove":
                # Todo
                pass

            elif command == "reset":
                self.before.clear()

            elif command == "stop":
                self.running = False


    def scan_comment_reply(self, comment):
        logging.info("Scanning comment reply from %s" % comment.author.name)

        bots_comment = self.reddit.get_info(thing_id=comment.parent_id)
        orig_comment = self.reddit.get_info(thing_id=bots_comment.parent_id)
        awardees_comment = self.reddit.get_info(thing_id=orig_comment.parent_id)

        commenter = comment.author.name
        awardee = awardees_comment.author.name

        if (comment.author.name == orig_comment.author.name
                and self.string_matches_message(bots_comment.body,
                                                'too_little_text', awardee)
                and not self.is_comment_too_short(orig_comment)
                and not self.is_parent_commenter_author(orig_comment)
                and not self.points_already_awarded_to_ancestor(orig_comment)):
            self.award_points(awardee, comment)
            message = self.get_message('confirmation')
            bots_comment.edit(message % awardee).distinguish()


    def scan_inbox(self):
        """ Scan a given list of messages for commands. If no list arg,
        then get newest comments from the inbox. """
        logging.info("Scanning inbox")

        messages = self.reddit.get_unread(unset_has_mail=True)

        for message in messages:
            # This is not pythonic. I'll need to research the right way to
            # handle this in python.
            if type(message) == praw.objects.Comment:
                self.scan_comment_reply(message)
            elif type(message) == praw.objects.Message:
                self.scan_message(message)

            message.mark_as_read()

    def scan_mod_mail(self):

        pass


    def update_leaderboard(self):
        """ Update the top 10 list with highest scores. """
        logging.info("Updating leaderboard")
        top_scores = self.get_top_ten_scores()
        score_table = [
            "\n\n# Top Ten Viewchangers",
            self.config.scoreboard['table_head'],
            self.config.scoreboard['table_leader_entry'] % (
                top_scores[0]['user'], top_scores[0]['flair_text'])
        ]

        for i in range(1, 10):
            table_entry = self.config.scoreboard['table_entry'] % (
                i+1, top_scores[i]['user'], top_scores[i]['flair_text'])
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


    def update_wiki_tracker(self, comment):
        comment_url = comment.permalink
        comment_submission = comment.submission
        comment_submission_title = comment_submission.title
        comment_submission_url = comment_submission.url
        parent = self.reddit.get_info(thing_id=comment.parent_id)
        parent_author = parent.author.name.lower()
        
        # try to get wiki page for user, throws exception if page doesn't exist
        try:
            user_wiki_page = self.reddit.get_wiki_page(self.config.subreddit,
                                                    parent_author)
            
            add_link = "\n\n* [%s](%s)" % (comment_submission_title,
                                           comment_url)
            new_content = user_wiki_page.content_md + add_link
            self.reddit.edit_wiki_page(self.config.subreddit,
                                       user_wiki_page.page,
                                       new_content,
                                       "Updated delta links.")
        
        # if page doesn't exist, create page with initial content
        except:
            initial_text = "/u/%s has received deltas for the following comments:\n\n" % parent_author
            add_link = "\n\n* [%s](%s)" % (comment_submission_title,
                                           comment_url)
            full_update = initial_text + add_link
            self.reddit.edit_wiki_page(self.config.subreddit,
                                       parent_author,
                                       full_update,
                                       "Created user's delta links page.")
            delta_tracker_page = self.reddit.get_wiki_page(
                                                          self.config.subreddit,
                                                          "delta_tracker")
            delta_tracker_page_body = delta_tracker_page.content_md
            authors_page = "http://www.reddit.com/r/%s/wiki/%s" % (
                                                          self.config.subreddit,
                                                          parent_author)
            new_link = "\n\n* /u/%s -- [Delta List](/r/%s/wiki/%s)" % (
                                                          parent_author,
                                                          self.config.subreddit,
                                                          parent_author)
            new_content = delta_tracker_page_body + new_link
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

            self.scan_inbox()
            self.scan_mod_mail()
            self.scan_comments()
            if self.changes_made:
                self.update_leaderboard()

            if self.before and old_before_id is not self.before[-1]:
                write_saved_id(self.config.last_comment_filename,
                               self.before[-1])

            logging.info("Iteration complete at %s" % (self.before[-1] if
                                                       self.before else "None"))
            logging.info("Sleeping for %s seconds" % self.config.sleep_time)
            time.sleep(self.config.sleep_time)
