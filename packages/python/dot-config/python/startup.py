# REPL improvements
import atexit  # noqa: F401
import readline
import rlcompleter  # noqa: F401

# common standard library imports
from datetime import datetime, timedelta  # noqa: F401
from pathlib import Path  # noqa: F401
from pprint import pprint
from timeit import timeit  # noqa: F401
from math import *  # noqa: F403
import random as r  # noqa: F401
import itertools as it  # noqa: F401
import json  # noqa: F401
import os  # noqa: F401
import sys

# common third party imports
try:
    import pandas as pd  # noqa: F401
except ImportError:
    pass

try:
    import numpy as np  # noqa: F401
except ImportError:
    pass

try:
    import polars as pl  # noqa: F401
except ImportError:
    pass

if "libedit" in readline.__doc__:
    readline.parse_and_bind("bind ^I rl_complete")
else:
    readline.parse_and_bind("tab: complete")

# prompt
sys.ps1 = "🐍 "
sys.ps2 = "| "

sys.displayhook = lambda x: pprint(x) if x is not None else None
