# -- coding: utf-8 --

import praw
SUBREDDIT_NAME = 'changemyview'

reddit = praw.Reddit("Updating flair format for users.")
reddit.login('deltabot', raw_input("Please enter password for bot: "))
subreddit = reddit.get_subreddit(SUBREDDIT_NAME)
print "Login successful"


#UPDATE FLAIR FORMAT START
print "Gathering list for upgrade"
flair_list = [flair for flair in subreddit.get_flair_list(limit=None)]

amt = len(flair_list)
print "{0} instances found.".format(amt)

done = 0
for flair in flair_list:
    if flair[u'flair_css_class'] in (u'points', "points", u'points ', "points "):
        subreddit.set_flair(flair[u'user'], flair[u'flair_text'] + u'∆', flair[u'flair_css_class'])
    else:
        print "CSS class check failed: {0}".format(flair[u'user'])
    done += 1
    if done % 100 == 0:
        print str(done) + " done"

print str(done)+"/"+str(amt)+" operations performed successfully."
#UPDATE FLAIR FORMAT END


#Upgrade script done
print "\n\nUpgrade script complete. Press any key to exit."
x = raw_input()