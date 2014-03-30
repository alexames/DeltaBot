import logging
import deltabot
#import config
import json
import os

def sandbox():
    #FOR TESTING. Put whatever here.
    bot = deltabot.DeltaBot()

# A whole new class just for some type checking was completely ridiculous
def get_config(configFile):
    if isinstance(configFile, dict):
        return configFile
    elif os.path.isfile(configFile):
        with open(configFile) as cF:
            return json.load(cF)
    else:
        return json.loads(configFile)

def main():
    #c   = config.Config(os.getcwd() + '/config/config.json')
    c = get_config(os.getcwd() + '/config/config.json')
    bot = deltabot.DeltaBot(c)
    bot.go()

if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG)
    main()
    #sandbox()
