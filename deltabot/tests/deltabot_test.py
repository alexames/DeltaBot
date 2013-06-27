import unittest
from mock import Mock
import deltabot.config
import deltabot.deltabot

class DeltaBotTest(unittest.TestCase):

    def get_subreddit_mock(self):
        subreddit_mock = Mock()
        subreddit_mock.get_comments.return_value = [

        ]
        return subreddit_mock

    def init_delta_bot(self):
        mock_reddit = Mock()
        mock_reddit.login.return_value = None
        mock_reddit.get_subreddit.return_value = self.get_subreddit_mock()
        config = deltabot.config.Config('{"subreddit":"aww","account":{"username":"user","password":"pass"}}')
        bot = deltabot.deltabot.DeltaBot(config, reddit = mock_reddit)
        return [bot, mock_reddit]

    def test_constructor(self):
        _, mock_reddit = self.init_delta_bot()
        mock_reddit.login.assert_called_once_with('user', 'pass')


    def test_scan(self):
        bot, mock_reddit = self.init_delta_bot()
        bot.scan()

