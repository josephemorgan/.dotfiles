#!/usr/bin/env python

# Write name of the currently-playing song and artist to a file.
# The output file is meant to be used in status bars and such.

import os
import sys
from os.path import expanduser, join

path = os.environ.get('XDG_CONFIG_HOME')
if not path:
    path = expanduser("~/.config")
else:
    path = expanduser(path)
fn = join(path, 'pianobar', 'nowplaying')

info = sys.stdin.readlines()
cmd = sys.argv[1]
fields = dict([line.strip().split("=" , 1) for line in info])

title = fields["title"]
artist = fields["artist"]

if cmd == 'songstart':
    with open(fn, 'w') as f:
        f.write("{} - {}\n".format(artist,title))
elif cmd == 'songfinish':
    with open(fn, 'w') as f:
        f.write("")
