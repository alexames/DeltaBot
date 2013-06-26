import logging
import deltabot
import config

def sandbox():
    #FOR TESTING. Put whatever here.
    bot = deltabot.DeltaBot()


def main():
    c   = config.Config('./config/config.json')
    bot = deltabot.DeltaBot(c)
    bot.go()

if __name__ == '__main__':
    main()
    #sandbox()