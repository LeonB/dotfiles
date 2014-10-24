#!/usr/bin/env python
## {{{ http://code.activestate.com/recipes/208993/ (r1)
#
# Author: Cimarron Taylor
# Date: July 6, 2003
# File Name: relpath.py
# Program Description: Print relative path from /a/b/c/d to /a/b/c1/d1

#
# helper functions for relative paths
#
import os
import sys
import ConfigParser, os
import re
import pipes
import subprocess

def pathsplit(p, rest=[]):
    (h,t) = os.path.split(p)
    if len(h) < 1: return [t]+rest
    if len(t) < 1: return [h]+rest
    return pathsplit(h,[t]+rest)

def commonpath(l1, l2, common=[]):
    if len(l1) < 1: return (common, l1, l2)
    if len(l2) < 1: return (common, l1, l2)
    if l1[0] != l2[0]: return (common, l1, l2)
    return commonpath(l1[1:], l2[1:], common+[l1[0]])

def relpath(p1, p2):
    (common,l1,l2) = commonpath(pathsplit(p1), pathsplit(p2))
    p = []
    if len(l1) > 0:
        p = [ '../' * len(l1) ]
    p = p + l2
    return os.path.join( *p )

if __name__ == '__main__':
    sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
    files = ['scf.ini', os.path.expanduser('~/.scf.ini'),
                 os.path.expanduser('~/.local/etc/scf.ini'), '/etc/scf.ini']
    config_files = []
    home = os.getenv('USERPROFILE') or os.getenv('HOME')
    rsync_command = 'rsync --recursive --delete --relative --progress %s'
    rsync_command = 'rsync --recursive --delete --relative --archive --progress %s'
    # rsync_command = 'rsync --recursive --delete --relative -rlptgD --progress %s'
    dest = os.path.realpath(os.path.expanduser('~/Documents/Config'))
    # dest = os.path.realpath(os.path.expanduser('~/Dropbox/Persoonlijk/Config'))

    for file in files:
        if not os.path.exists(file):
            continue

        lines = open(file, 'r').readlines()
        for line in lines:
            line = line.strip()

            if not line:
                continue

            if  re.search('^#', line):
                continue

            if not os.path.isabs(line):
                config_file = os.path.expanduser(line)
                config_file = os.path.realpath(config_file)
                config_file = relpath(home, config_file)
            else:
                config_file = line

            if not os.path.exists(config_file):
                continue

            config_files.append(config_file)

    for k, config_file in enumerate(config_files):
        config_files[k] = pipes.quote(config_file)

    cmd = rsync_command % (' '.join(config_files) + ' ' + dest)
    print cmd
    #import sys
    #sys.exit(12)
    proc = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)

    stdout = ''
    while proc.poll() == None:
        stdout = stdout + proc.stdout.read()

    if stdout.strip():
        print stdout, #with comma: don't print a newline

    if proc.stderr.read().strip():
        print proc.stderr.read(),
