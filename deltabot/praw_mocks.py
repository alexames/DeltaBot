
import random
import string


def reddit_id(length=6):
    """Emulate a reddit id with a random string of letters and digits"""
    return ''.join(random.choice(string.ascii_lowercase +
                   string.digits) for x in range(length))

# The following classes are meant to emulate various PRAW objects
# They do not contain all of the same attributes if the original
# PRAW class, but only the necessary ones needed for testing the
# process_unread function.

class Reddit(object):
    def __init__(self):
        self._sent_message = False
        self._message_recipient = ''
        self._message_subject = ''
        self._message_text = ''
        # Allows a custom comment to be assigned that is used to
        # verify if get_submission is working correctly.
        self._get_sub_comment = None
        self.info = dict()

    def set_info(self, thing_id, value):
        self.info[thing_id] = value

    def get_info(self, thing_id):
        return self.info[thing_id]

    def login(*args, **kwargs):
        pass

    def get_subreddit(*args, **kwargs):
        return Subreddit()

    def send_message(self, recipient, subject, text, **kwargs):
        self._sent_message = True
        self._message_recipient = recipient
        self._message_subject = subject
        self._message_text = text

    def get_submission(self, *args, **kwargs):
        s = Submission()
        if kwargs.get('submission_id') == self._get_sub_comment.permalink:
            s.comments.append(self._get_sub_comment)
        return s


class Subreddit(object):
    def __init__(self):
        pass


class Repliable(object):
    def __init__(self, author=None, body='', reddit_session=None, replies=[]):
        self.author = author or Author()
        self.body = body
        self.replies = replies
        self.id = reddit_id()
        self.reddit_session = reddit_session
        self._replied_to = False
        self._reply_text = ''

    def reply(self, text):
        self._replied_to = True
        self._reply_text = text


class Author(object):
    def __init__(self, name=''):
        self.name = name

    def __eq__(self, other):
        return self.name == other.name

    def __ne__(self, other):
        return self.name != other.name

    def __str__(self):
        return self.name


class Message(Repliable):
    def __init__(self, *args,  **kwargs):
        Repliable.__init__(self, *args, **kwargs)
        self.was_comment = False


class Submission(Repliable):
    def __init__(self, *args,  **kwargs):
        Repliable.__init__(self, *args, **kwargs)


class Comment(Repliable):
    def __init__(self, *args, **kwargs):
        Repliable.__init__(self, *args, **kwargs)
        self.was_comment = True
        self.permalink = reddit_id() + '/test/' + self.id
        self._edited = False
        self._edit_text = ''
        self.submission = Submission()

    def edit(self, text):
        self._edited = True
        self._edit_text = text