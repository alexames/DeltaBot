from r2.models import Account, Link, Comment, Vote, Report
from r2.models import Message, Inbox, Subreddit, ModContribSR, ModeratorInbox, MultiReddit
from r2.lib.db.thing import Thing, Merge
from r2.lib.db.operators import asc, desc, timeago
from r2.lib.db.sorts import epoch_seconds
from r2.lib.utils import fetch_things2, tup, UniqueIterator, set_last_modified
from r2.lib import utils
from r2.lib import amqp, sup, filters
from r2.lib.comment_tree import add_comments, update_comment_votes
from r2.models.promo import PROMOTE_STATUS, get_promote_srid
from r2.models.query_cache import (
    cached_query,
    CachedQuery,
    CachedQueryMutator,
    filter_thing,
    merged_cached_query,
    MergedCachedQuery,
    SubredditQueryCache,
    ThingTupleComparator,
    UserQueryCache,
)
from r2.models.last_modified import LastModified
from r2.lib.utils import SimpleSillyStub

import cPickle as pickle

from datetime import datetime
from time import mktime
import pytz
import itertools
import collections
from copy import deepcopy
from r2.lib.db.operators import and_, or_

from pylons import g
query_cache = g.permacache
log = g.log
make_lock = g.make_lock
worker = amqp.worker
stats = g.stats

precompute_limit = 1000


from r2.lib.db import queries

def new_add_all_srs():
    """Recalculates every listing query for every subreddit. Very,
       very slow."""
    q = Subreddit._query(sort = asc('_date'))
    for sr in fetch_things2(q):
        for q in queries.all_queries(queries.get_links, sr, ('hot', 'new'), ['all']):
            q.update()
        for q in queries.all_queries(queries.get_links, sr, queries.time_filtered_sorts, queries.db_times.keys()):
            q.update()

queries.add_all_srs = new_add_all_srs

queries.add_all_srs()