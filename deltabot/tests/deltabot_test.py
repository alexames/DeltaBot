import unittest
from mock import Mock
import deltabot.config
import deltabot.deltabot

class DeltaBotTest(unittest.TestCase):

    def test_constructor(self):
        mock_reddit = Mock()
        mock_reddit.login.return_value = None
        config = deltabot.config.Config('{"subreddit":"aww","account":{"username":"user","password":"pass"}}')
        bot = deltabot.deltabot.DeltaBot(config, reddit = mock_reddit)
        mock_reddit.login.assert_called_once_with('user', 'pass')