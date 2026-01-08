# REPL improvements
import atexit
import readline
import rlcompleter

# common standard library imports
from datetime import datetime, timedelta
from pathlib import Path
from pprint import pprint
from timeit import timeit
from math import *
import random as r
import itertools as it
import json
import os
import sys

# common third party imports
try:
    import pandas as pd
except ImportError:
    pass

try:
    import numpy as np
except ImportError:
    pass

try:
    import polars as pl
except ImportError:
    pass

readline.parse_and_bind("tab: complete")

# prompt
sys.ps1 = "> "
sys.ps2 = "| "

sys.displayhook = lambda x: pprint(x) if x is not None else None
