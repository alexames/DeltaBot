# encoding: utf-8
from __future__ import division
import re
import time
import praw
import logging


logging.getLogger('requests').setLevel(logging.WARNING) # hide messages from requests


def get_first_int(string):
    """ Returns the first integer in the string"""
    match = re.search(u'(\d+)', string)
    return int(match.group()) if match else 0


def flair_sorter(dic):
    """ Get numeric value from flair. """
    num = dic[u'flair_text']
    if num:
        return get_first_int(num)
    else:
        return 0


def skippable_line(line):
    """ Returns true if the give line is a quote or code """
    return re.search('(^    |^ *&gt;)', line) != None


def string_contains_token(text, tokens):
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
        self.reddit = praw.Reddit(self.config.subreddit + ' bot', site_name=config.site_name)
        self.reddit.login(*[self.config.account['username'], self.config.account['password']])
        self.subreddit = self.reddit.get_subreddit(self.config.subreddit)
        self.comment_id_regex = u'(?:http://)?(?:www\.)?reddit\.com/r(?:eddit)?/' + self.config.subreddit + '/comments/[\d\w]+(?:/[^/]+)/?([\d\w]+)'
        self.before_id = read_saved_id(self.config.last_comment_filename)
        self.changes_made = False
        longest = 0
        for token in self.config.tokens:
            if len(token) > longest:
                longest = len(token)
        self.minimum_comment_length = longest + self.config.minimum_comment_length


    def award_points(self, parent, comment):
        """ Awards a point. """
        logging.info("Awarding point to %s" % parent.author)
        self.add_points(parent.author)
        self.update_wiki_tracker(comment)
        comment.reply(self.config.messages['confirmation'][0] % parent.author).distinguish()


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
                and string_contains_token(comment.body, self.config.tokens)):
                return True

        return False


    def points_already_awarded(self, comment):
        """ Returns true if Deltabot has replied to this comment """
        for reply in comment.replies:
            if reply.author == self.config.account['username']:
                return True;
        return False


    def is_parent_commenter_author(self, comment):
        """ returns true if the author of the parent comment the submitter """
        return self.reddit.get_info(thing_id=comment.parent_id).author == comment.submission.author


    def scan_comment(self, comment):
        logging.info("Scanning comment %s by %s" % (comment.name, comment.author))

        parent = self.reddit.get_info(thing_id=comment.parent_id)

        if string_contains_token(comment.body, self.config.tokens) and parent.author.name is not self.config.account['username']:

            if self.is_parent_commenter_author(comment):
                logging.info("No points awarded, parent is OP")
                comment.reply(self.config.messages['broken_rule'][0]).distinguish()
                return
            if self.points_already_awarded_to_ancestor(comment):
                logging.info("No points awarded, already awarded")
                comment.reply(self.config.messages['already_awarded'][0] % parent.author).distinguish()
                return
            if len(comment.body) < self.minimum_comment_length:
                logging.info("No points awarded, too short")
                comment.reply(self.config.messages['too_little_text'][0] % parent.author).distinguish()
                return
            if self.points_already_awarded(comment):
                # We scaned this comment more than once, no need to reply. Just continue on silently
                return

            self.award_points(parent, comment)


    def scan_comments(self):
        """ Scan a given list of comments for tokens. If a token is found, award points. """
        logging.info("Scanning new comments")

        for comment in self.subreddit.get_comments(params={'before': self.before_id}):
            self.scan_comment(comment)
            if not self.before_id or comment.name > self.before_id:
                self.before_id = comment.name


    def scan_inbox(self):
        """ Scan a given list of messages for commands. If no list arg,
        then get newest comments from the inbox. """
        logging.info("Scanning inbox")

        messages = [message for message in self.reddit.get_unread()]
        moderators = [mod.name for mod in self.reddit.get_moderators(self.config.subreddit)]

        for message in messages:
            logging.info("Scanning message %s from %s" % (message.name, message.author))
            if message.author.name in moderators:
                if message.subject.lower() == "add":
                    ids = re.findall(self.comment_id_regex, message.body)
                    for id in ids:
                        comment = self.reddit.get_info(thing_id=u't1_{0}'.format(id))
                        if type(comment) is praw.objects.Comment:
                            self.scan_comment(comment)

                elif message.subject.lower() == "remove":
                    # Todo
                    pass

                elif message.subject.lower() == "stop":
                    self.running = False

            message.mark_as_read()


    def update_leaderboard(self):
        """ Update the top 10 list with highest scores. """
        logging.info("Updating leaderboard")
        top_scores = self.get_top_ten_scores()
        score_table = ["\n\n# Top Ten Viewchangers", self.config.scoreboard['table_head'],
                      self.config.scoreboard['table_leader_entry'] % ((top_scores[0][u'user'], \
                      top_scores[0][u'flair_text']))]

        for i in range(9):
            score_table.append(self.config.scoreboard['table_entry'] % ((i+2, top_scores[i+1][u'user'], top_scores[i+1][u'flair_text'])))

        settings = self.subreddit.get_settings()
        old_desc = settings[u'description']
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
            flair_list.append({u'user': u'none', u'flair_text': u'no score'})
        return flair_list[0:10]


    def update_wiki_tracker(self, comment):
        comment_url = comment.permalink
        comment_submission = comment.submission
        comment_submission_title = comment_submission.title
        comment_submission_url = comment_submission.url
        parent = self.reddit.get_info(thing_id=comment.parent_id)
        parent_author = parent.author.name.lower()
        try:
            user_wiki_page = self.reddit.get_wiki_page(self.config.subreddit, parent_author)
            if user_wiki_page.page == parent_author:
                add_link = "\n[%s](%s)" % (comment_submission_title, comment_url)
                new_content = user_wiki_page.content_md + add_link
                self.reddit.edit_wiki_page(self.config.subreddit, user_wiki_page.page, new_content, "Updated delta links.")
        except:
            initial_text = "/u/%s has received deltas for the following comments:\n\n" % parent_author
            add_link = "\n* [%s](%s)" % (comment_submission_title, comment_url)
            full_update = initial_text + add_link
            self.reddit.edit_wiki_page(self.config.subreddit, parent_author, full_update, "Created user's delta links page.")
            delta_tracker_page = self.reddit.get_wiki_page(self.config.subreddit, "delta_tracker")
            delta_tracker_page_body = delta_tracker_page.content_md
            authors_page = "http://www.reddit.com/r/%s/wiki/%s" % (self.config.subreddit, parent_author)
            new_link = "\n* /u/%s" % (parent_author)
            new_content = delta_tracker_page_body + new_link
            self.reddit.edit_wiki_page(self.config.subreddit, "delta_tracker", new_content, "Updated tracker page.")


    def go(self):
        """ Start DeltaBot. """
        self.running = True
        while self.running:
            logging.info("Starting iteration at %s" % self.before_id)
            old_before_id = self.before_id

            try:
                self.scan_comments()
                self.scan_inbox()
                if self.changes_made:
                    self.update_leaderboard()
            except Exception:
                pass

            logging.info("Iteration complete at %s" % self.before_id)
            if old_before_id is not self.before_id:
                write_saved_id(self.config.last_comment_filename, self.before_id)

            logging.info("Sleeping for %s seconds" % self.config.sleep_time)
            time.sleep(self.config.sleep_time)
