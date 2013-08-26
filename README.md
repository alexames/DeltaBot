# DeltaBot

Deltabot is a score keeping reddit bot originally designed for [/r/changemyview](http://reddit.com/r/changemyview)

It works by reading a subreddit, looking for specific tokens that denote that a point should be awarded. If it finds one, it awards that user a point by adjusting their flair.

## Usage

Firstly, make sure you have Python and PRAW installed. Then create the file `config.json` and fill in the appropriate fields useing `config.json.example` as a template. Finally, run the `runbot.sh` script (or run `__main__.py` directly).

Make sure whatever account you're using to run the bot is a moderator of your subreddit and has permission to edit flair and the wiki.

## Contribute

If you're a developer visit the developer subreddit [/r/DeltaBot](http://reddit.com/r/DeltaBot)

[Join us on IRC!](http://webchat.snoonet.org/DeltaBot) (Snoonet #DeltaBot)
