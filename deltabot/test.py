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

import unittest
import logging
import os
import random
import string

import config
import deltabot

testConfig   = config.Config(os.getcwd() + '/config/config.json')
logging.getLogger('requests').setLevel(logging.WARNING)

def reddit_id(length=6):
    """Emulate a reddit id with a random string of letters and digits"""
    return ''.join(random.choice(string.ascii_lowercase +
                   string.digits) for x in range(length))

def test_suite():
    cases = [TestScanComment]
    alltests = [unittest.TestLoader().loadTestsFromTestCase(case) for case in cases]
    return unittest.TestSuite(alltests)

class TestScanComment(unittest.TestCase):
    # The following classes are meant to emulate various PRAW objects
    # They do not contain all of the same attributes if the original
    # PRAW class, but only the necessary ones needed for testing the
    # process_unread function.

    class Reddit(object):
        def __init__(self):
            self._sent_message = False
            self._message_recipient = ''
            self._message_subject = ''
            self._message_text = ''
            # Allows a custom comment to be assigned that is used to
            # verify if get_submission is working correctly.
            self._get_sub_comment = None

        def login(*args, **kwargs):
            pass

        def get_subreddit(*args, **kwargs):
            return TestScanComment.Subreddit()

        def send_message(self, recipient, subject, text, **kwargs):
            self._sent_message = True
            self._message_recipient = recipient
            self._message_subject = subject
            self._message_text = text

        def get_submission(self, *args, **kwargs):
            s = TestScanComment.Submission()
            if kwargs.get('submission_id') == self._get_sub_comment.permalink:
                s.comments.append(self._get_sub_comment)
            return s

    class Subreddit(object):
        def __init__(self):
            pass


    class Submission(object):
        def __init__(self):
            self.comments = []

    class Repliable(object):
        def __init__(self, author=None, body='', reddit_session=None, replies=[]):
            self.author = author or TestScanComment.Author()
            self.body = body
            self.replies = replies
            self.id = reddit_id()
            self.reddit_session = reddit_session
            self._replied_to = False
            self._reply_text = ''

        def reply(self, text):
            self._replied_to = True
            self._reply_text = text

    class Author(object):
        def __init__(self, name=''):
            self.name = name

        def __eq__(self, other):
            return self.name == other.name

        def __ne__(self, other):
            return self.name != other.name

        def __str__(self):
            return self.name

    class Message(Repliable):
        def __init__(self, *args,  **kwargs):
            TestScanComment.Repliable.__init__(self, *args, **kwargs)
            self.was_comment = False

    class Comment(Repliable):
        def __init__(self, *args, **kwargs):
            TestScanComment.Repliable.__init__(self, *args, **kwargs)
            self.was_comment = True
            self.permalink = reddit_id() + '/test/' + self.id
            self._edited = False
            self._edit_text = ''

        def edit(self, text):
            self._edited = True
            self._edit_text = text

    def setUp(self):
        self.bot = deltabot.DeltaBot(testConfig, test=True, test_reddit=self.Reddit())

    def test_is_comment_too_short(self):
        logging.debug("Testing Feature 2.4")

        no_comment = self.Comment(body="")
        short_comment = self.Comment(body="a"*(self.bot.minimum_comment_length-1))
        good_comment = self.Comment(body="a"*self.bot.minimum_comment_length)
        long_comment = self.Comment(body="a"*(self.bot.minimum_comment_length*10))

        self.assertTrue(self.bot.is_comment_too_short(no_comment), "is_comment_too_short() returns False with empty comment")
        self.assertTrue(self.bot.is_comment_too_short(short_comment), "is_comment_too_short() returns False with short comment")
        self.assertFalse(self.bot.is_comment_too_short(good_comment), "is_comment_too_short() returns True with good comment")
        self.assertFalse(self.bot.is_comment_too_short(long_comment), "is_comment_too_short() returns True with long comment")



if __name__ == '__main__':
    unittest.main()