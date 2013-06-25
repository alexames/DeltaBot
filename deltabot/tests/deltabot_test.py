import unittest
from mock import Mock
import deltabot.config
import deltabot.deltabot

class DeltaBotTest(unittest.TestCase):

    def test_constructor(self):
        mock_reddit = Mock()
        mock_reddit.login.return_value = True
        config = deltabot.config.Config('{"subreddit":"aww","account":{"username":"u","password":"p"}}')
        bot = deltabot.deltabot.DeltaBot(config, reddit = mock_reddit)