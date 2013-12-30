#!/usr/bin/env python
import sys

for i in range(2):
    for j in range(30, 38):
        for k in range(40, 48):
            print "\33[%d;%d;%dm%d;%d;%d\33[m " % (i, j, k, i, j, k),
        print
