import json
import os

# This object holds the configuration options for the bot
class Config(object):

    def __init__(self, configFile):
        if os.path.isfile(configFile):
            self.attrs = json.load(open(configFile))
        else:
            self.attrs = json.loads(configFile)

    def __getattr__(self, name):
        return self.attrs[name]