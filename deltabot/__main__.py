import logging
import deltabot

def sandbox():
    #FOR TESTING. Put whatever here.
    bot = deltabot.DeltaBot()


def main():
    bot = deltabot.DeltaBot()
    bot.go()

if __name__ == '__main__':
    main()
    #sandbox()