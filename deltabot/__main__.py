import logging
import deltabot
import config
import json
import os

def sandbox():
    #FOR TESTING. Put whatever here.
    bot = deltabot.DeltaBot()

def main():
    c   = config.Config(os.getcwd() + '/config/config.json')
    bot = deltabot.DeltaBot(c)
    bot.go()

if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG)
    main()
    #sandbox()
