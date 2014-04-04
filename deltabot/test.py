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

import unittest
import logging
import os

import config
import deltabot
from praw_mocks import *

test_config = config.Config(os.getcwd() + '/config/config.json')
logging.getLogger('requests').setLevel(logging.WARNING)


def test_suite():
    cases = [TestScanComment]
    alltests = [unittest.TestLoader().loadTestsFromTestCase(case) for case in cases]
    return unittest.TestSuite(alltests)


class DeltaBotTestCase(unittest.TestCase):
    def setUp(self):
        self.bot = deltabot.DeltaBot(config=test_config, reddit=Reddit())


class TestScanComment(DeltaBotTestCase):
    def test_correctly_awards_delta(self):
        """
        2 - If a comment contains a Delta Symbol, DeltaBot should award 1 point to the author of the comment's parent
        """

        # Comment must contain a Delta and be long enough
        comment = Comment(body=test_config.tokens[0] + "a" * self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                      check_already_replied=lambda c: False,
                                                      check_is_parent_commenter_author=lambda c, p: False,
                                                      check_points_already_awarded_to_ancestor=lambda c, p: False,
                                                      strict=True)

        test_messages = []
        for confirmation_message in test_config.messages['confirmation']:
            test_message = (confirmation_message +
                            test_config.messages['append_to_all_messages']) % (parent.author,
                                                                               test_config.subreddit,
                                                                               parent.author)
            test_messages.append(test_message)

        self.assertEqual(log, "", "Did not properly award a delta: %s" % log)
        self.assertIn(message, test_messages, "Did not properly award a delta, sent wrong message: %s" % message)
        self.assertEqual(awardee, parent.author.name, "Did not properly award a delta, awardee: %s" % awardee)

        # Comment must contain be long enough but NOT contain a delta
        comment = Comment(body="a" * self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                      check_already_replied=lambda c: False,
                                                      check_is_parent_commenter_author=lambda c, p: False,
                                                      check_points_already_awarded_to_ancestor=lambda c, p: False,
                                                      strict=True)

        self.assertEqual(log, "No points awarded, comment does not contain Delta",
                         "Improperly awarded a delta: %s" % log)
        self.assertIsNone(message, "Improperly awarded a delta, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Improperly awarded a delta, awardee: %s" % awardee)

    def test_checking_author(self):
        """2.1 - The parent is OP, DeltaBot or the awarder."""

        # Test with reply to OP
        comment = Comment(body=test_config.tokens[0] + "a" * self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                      check_already_replied=lambda c: False,
                                                      check_is_parent_commenter_author=lambda c, p: True,
                                                      check_points_already_awarded_to_ancestor=lambda c, p: False,
                                                      strict=True)

        test_messages = [m + test_config.messages['append_to_all_messages'] for m in
                         test_config.messages['broken_rule']]

        self.assertEqual(log, "No points awarded, parent is OP", "Did not properly recognize a reply to OP: %s" % log)
        self.assertIn(message, test_messages,
                      "Did not properly recognize a reply to OP, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize a reply to OP, awardee: %s" % awardee)

        # Test with reply to DeltaBot
        comment = Comment(body=test_config.tokens[0] + "a" * self.bot.minimum_comment_length)
        parent = Comment(author=Author(name=test_config.account['username']))

        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                      check_already_replied=lambda c: False,
                                                      check_is_parent_commenter_author=lambda c, p: False,
                                                      check_points_already_awarded_to_ancestor=lambda c, p: False,
                                                      strict=True)

        self.assertEqual(log, "No points awarded, replying to DeltaBot",
                         "Did not properly recognize a reply to DeltaBot")
        self.assertIsNone(message, "Did not properly recognize a reply to DeltaBot, message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize a reply to DeltaBot, awardee: %s" % awardee)

    def test_already_replied(self):
        """2.2 - The commenter has already awarded a delta to this comment."""
        comment = Comment(body=test_config.tokens[0] + "a" * self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                      check_already_replied=lambda c: True,
                                                      check_is_parent_commenter_author=lambda c, p: False,
                                                      check_points_already_awarded_to_ancestor=lambda c, p: False,
                                                      strict=True)

        self.assertEqual(log, "No points awarded, already replied",
                         "Did not properly recognize an already replied: %s" % log)
        self.assertIsNone(message, "Did not properly recognize an already replied, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize an already replied, awardee: %s" % awardee)

    def test_ancestor_points(self):
        """2.3 - The commenter has already awarded a delta to the parent's author at a higher point in the thread
        (but elsewhere in the comment tree or elsewhere in the submission's comment page are cool)"""

        comment = Comment(body=test_config.tokens[0] + "a" * self.bot.minimum_comment_length)
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                      check_already_replied=lambda c: False,
                                                      check_is_parent_commenter_author=lambda c, p: False,
                                                      check_points_already_awarded_to_ancestor=lambda c, p: True,
                                                      strict=True)

        test_messages = []
        for already_awarded_message in test_config.messages['already_awarded']:
            test_message = (already_awarded_message + test_config.messages['append_to_all_messages']) % parent.author
            test_messages.append(test_message)

        self.assertEqual(log, "No points awarded, already awarded",
                         "Did not properly recognize an award to descendent: %s" % log)
        self.assertIn(message, test_messages,
                      "Did not properly recognize an award to descendent, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize an award to descendent, awardee: %s" % awardee)

    def test_check_comment_length(self):
        """2.4 - The comment is shorter than [length]"""

        comment = Comment(body=test_config.tokens[0] + "a" * (self.bot.minimum_comment_length - 2))
        parent = Comment(author=Author(name='Someone'))

        log, message, awardee = self.bot.scan_comment(comment, parent,
                                                      check_already_replied=lambda c: False,
                                                      check_is_parent_commenter_author=lambda c, p: False,
                                                      check_points_already_awarded_to_ancestor=lambda c, p: False,
                                                      strict=True)

        test_messages = []
        for too_little_message in test_config.messages['too_little_text']:
            test_message = (too_little_message + test_config.messages['append_to_all_messages']) % parent.author
            test_messages.append(test_message)

        self.assertEqual(log, "No points awarded, too short", "Did not properly recognize a short comment: %s" % log)
        self.assertIn(message, test_messages,
                      "Did not properly recognize a short comment, sent wrong message: %s" % message)
        self.assertIsNone(awardee, "Did not properly recognize a short comment, awardee: %s" % awardee)


class TestAlreadyReplied(DeltaBotTestCase):
    def test_no_replies(self):
        comment = Comment(replies=[])

        result = self.bot.already_replied(comment, test=True)
        self.assertFalse(result, "already_replied returns True with no replies")

    @unittest.skip("Need to clear up side effect in already_replied()")
    def test_one_bot_reply(self):
        replies = [Comment(author=Author(name=test_config.account['username']))]
        comment = Comment(replies=replies)

        result = self.bot.already_replied(comment, test=True)
        self.assertTrue(result, "already_replied returns False when DeltaBot is only reply")

    @unittest.skip("Need to clear up side effect in already_replied()")
    def test_with_many_replies(self):
        replies = [Comment(author=Author(name="PersonNumber" + str(x))) for x in range(10)]
        replies.append(Comment(author=Author(name=test_config.account['username'])))

        comment = Comment(replies=replies)
        result = self.bot.already_replied(comment, test=True)
        self.assertTrue(result, "already_replied returns False when DeltaBot is one of many replies")


class TestIsParentCommenterAuthor(DeltaBotTestCase):
    def test_with_op_parent(self):
        comment = Comment()
        comment.submission = Submission(author=Author(name="Someone"))
        parent = Comment(author=Author(name="Someone"))

        result = self.bot.is_parent_commenter_author(comment, parent)
        self.assertTrue(result, "is_parent_commenter_author() could not recognize OP as author")

    def test_with_op_not_parent(self):
        comment = Comment()
        comment.submission = Submission(author=Author(name="Someone"))
        parent = Comment(author=Author(name="SomeoneElse"))

        result = self.bot.is_parent_commenter_author(comment, parent)
        self.assertFalse(result, "is_parent_commenter_author() incorrectly recognized OP as author")


class TestAncestorPoints(DeltaBotTestCase):
    # Need a more complicated mock in order to test this
    def test_with_root_comment(self):
        pass


class TestIsCommentTooShort(DeltaBotTestCase):
    def test_no_comment(self):
        no_comment = Comment(body="")
        result = self.bot.is_comment_too_short(no_comment)
        self.assertTrue(result, "is_comment_too_short() returns False with empty comment")

    def test_short_comment(self):
        short_comment = Comment(body="a" * (self.bot.minimum_comment_length - 1))
        result = self.bot.is_comment_too_short(short_comment)
        self.assertTrue(result, "is_comment_too_short() returns False with short comment")

    def test_good_comment(self):
        good_comment = Comment(body="a" * self.bot.minimum_comment_length)
        result = self.bot.is_comment_too_short(good_comment)
        self.assertFalse(result, "is_comment_too_short() returns True with good comment")

    def test_long_comment(self):
        long_comment = Comment(body="a" * (self.bot.minimum_comment_length * 10))
        result = self.bot.is_comment_too_short(long_comment)
        self.assertFalse(result, "is_comment_too_short() returns True with long comment")


if __name__ == '__main__':
    unittest.main()
