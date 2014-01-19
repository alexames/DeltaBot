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
from praw_mocks import *

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
    def setUp(self):
        self.bot = deltabot.DeltaBot(testConfig, test=True, test_reddit=Reddit())

    def test_correctly_awards_delta(self):
        """2 - If a comment contains a Delta Symbol, DeltaBot should award 1 point to the author of the comment's parent"""

        # Comment must contain a Delta and be long enough
        comment = Comment(body=testConfig.tokens[0] + "a"*self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = (None, None, None)
        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                  check_already_replied=lambda c: False,
                                                  check_is_parent_commenter_author=lambda c, p: False,
                                                  check_points_already_awarded_to_ancestor=lambda c: False,
                                                  strict=True)

        testMessages = [(m + testConfig.messages['append_to_all_messages'])  % (parent.author,
                    testConfig.subreddit, parent.author) for m in testConfig.messages['confirmation']]

        self.assertEqual(log,"", "Did not properly award a delta: %s" % log)
        self.assertIn(message, testMessages, "Did not properly award a delta, sent wrong message: %s" % message)
        self.assertEqual(awardee, parent.author.name, "Did not properly award a delta, awardee: %s" % awardee)

        # Comment must contain be long enough but NOT contain a delta
        comment = Comment(body="a"*self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = (None, None, None)
        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                  check_already_replied=lambda c: False,
                                                  check_is_parent_commenter_author=lambda c, p: False,
                                                  check_points_already_awarded_to_ancestor=lambda c: False,
                                                  strict=True)

        testMessages = [(m + testConfig.messages['append_to_all_messages'])  % (parent.author,
                    testConfig.subreddit, parent.author) for m in testConfig.messages['confirmation']]

        self.assertEqual(log,"No points awarded, comment does not contain Delta", "Improperly awarded a delta: %s" % log)
        self.assertIsNone(message, "Improperly awarded a delta, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Improperly awarded a delta, awardee: %s" % awardee)

    def test_checking_author(self):
        """2.1 - The parent is OP, DeltaBot or the awarder."""

        #Test with reply to OP
        comment = Comment(body=testConfig.tokens[0] + "a"*self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = (None, None, None)
        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                  check_already_replied=lambda c: False,
                                                  check_is_parent_commenter_author=lambda c, p: True,
                                                  check_points_already_awarded_to_ancestor=lambda c: False,
                                                  strict=True)

        testMessages = [m + testConfig.messages['append_to_all_messages'] for m in testConfig.messages['broken_rule']]

        self.assertEqual(log,"No points awarded, parent is OP", "Did not properly recognize a reply to OP: %s" % log)
        self.assertIn(message, testMessages, "Did not properly recognize a reply to OP, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize a reply to OP, awardee: %s" % awardee)

        #Test with reply to DeltaBot
        comment = Comment(body=testConfig.tokens[0] + "a"*self.bot.minimum_comment_length)
        parent = Comment(author=Author(name=testConfig.account['username']))

        log, message, awardee = (None, None, None)
        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                  check_already_replied=lambda c: False,
                                                  check_is_parent_commenter_author=lambda c: False,
                                                  check_points_already_awarded_to_ancestor=lambda c: False,
                                                  strict=True)
        self.assertEqual(log,"No points awarded, replying to DeltaBot", "Did not properly recognize a reply to DeltaBot")
        self.assertIsNone(message, "Did not properly recognize a reply to DeltaBot, message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize a reply to DeltaBot, awardee: %s" % awardee)

    def test_already_replied(self):
        """2.2 - The commenter has already awarded a delta to this comment."""
        comment = Comment(body=testConfig.tokens[0] + "a"*self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = (None, None, None)
        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                  check_already_replied=lambda c: True,
                                                  check_is_parent_commenter_author=lambda c: False,
                                                  check_points_already_awarded_to_ancestor=lambda c: False,
                                                  strict=True)

        self.assertEqual(log,"No points awarded, already replied", "Did not properly recognize an already replied: %s" % log)
        self.assertIsNone(message, "Did not properly recognize an already replied, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize an already replied, awardee: %s" % awardee)


    def test_ancestor_points(self):
        """2.3 - The commenter has already awarded a delta to the parent's author at a higher point in the thread
        (but elsewhere in the comment tree or elsewhere in the submission's comment page are cool)"""

        comment = Comment(body=testConfig.tokens[0] + "a"*self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = (None, None, None)
        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                  check_already_replied=lambda c: False,
                                                  check_is_parent_commenter_author=lambda c, p: False,
                                                  check_points_already_awarded_to_ancestor=lambda c:True,
                                                  strict=True)

        testMessages = [(m + testConfig.messages['append_to_all_messages'])  % parent.author for m in testConfig.messages['already_awarded']]

        self.assertEqual(log,"No points awarded, already awarded", "Did not properly recognize an award to descendent: %s" % log)
        self.assertIn(message, testMessages, "Did not properly recognize an award to descendent, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize an award to descendent, awardee: %s" % awardee)

    def test_check_comment_length(self):
        """2.4 - The comment is shorter than [length]"""

        comment = Comment(body=testConfig.tokens[0] + "a"*(self.bot.minimum_comment_length-2))
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = (None, None, None)
        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                  check_already_replied=lambda c: False,
                                                  check_is_parent_commenter_author=lambda c, p: False,
                                                  check_points_already_awarded_to_ancestor=lambda c: False,
                                                  strict=True)

        testMessages = [(m + testConfig.messages['append_to_all_messages'])  % parent.author for m in testConfig.messages['too_little_text']]

        self.assertEqual(log,"No points awarded, too short", "Did not properly recognize a short comment: %s" % log)
        self.assertIn(message, testMessages, "Did not properly recognize a short comment, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize a short comment, awardee: %s" % awardee)

    def test_is_comment_too_short(self):
        """2.4 - The comment is shorter than [length]"""

        no_comment = Comment(body="")
        short_comment = Comment(body="a"*(self.bot.minimum_comment_length-1))
        good_comment = Comment(body="a"*self.bot.minimum_comment_length)
        long_comment = Comment(body="a"*(self.bot.minimum_comment_length*10))

        self.assertTrue(self.bot.is_comment_too_short(no_comment), "is_comment_too_short() returns False with empty comment")
        self.assertTrue(self.bot.is_comment_too_short(short_comment), "is_comment_too_short() returns False with short comment")
        self.assertFalse(self.bot.is_comment_too_short(good_comment), "is_comment_too_short() returns True with good comment")
        self.assertFalse(self.bot.is_comment_too_short(long_comment), "is_comment_too_short() returns True with long comment")


if __name__ == '__main__':
    unittest.main()