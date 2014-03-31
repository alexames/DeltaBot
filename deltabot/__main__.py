import logging
import deltabot
import config
import os
import praw


def sandbox():
    #FOR TESTING. Put whatever here.
    bot = deltabot.DeltaBot()

def main():
    conf = config.Config(os.getcwd() + '/config/config.json')
    reddit_client = praw.Reddit(conf.subreddit + ' bot', site_name=conf.site_name)

    bot = deltabot.DeltaBot(conf, reddit_client)
    bot.go()


if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG)
    main()
    #sandbox()
