#!/usr/bin/env python

import subprocess
import re
import sys

#If invoked without any option, it will dump the state of  the  outputs,
#showing  the existing modes for each of them, with a '+' after the pre-
#ferred mode and a '*' after the current mode.

LAPTOP_SCREEN = "LVDS1"
XRANDR = '/usr/bin/xrandr'

cmd = [XRANDR, '-q']
p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
stdoutdata, stderrdata = p.communicate()

matches = re.findall('^([A-Z0-9]*)\sconnected', stdoutdata, 
                     flags=re.MULTILINE | re.DOTALL)

cmd = [XRANDR]
for output in matches:
    cmd.append('--output')
    cmd.append(output)
    
    # If this is the laptop screen, and we have 2 or more screens:
    if output == LAPTOP_SCREEN and len(matches) >= 2:
        # Dont' enable the laptop screen
        cmd.append('--off')
    else:
        # Enable it
        cmd.append('--auto')

    #print re.findall(output+'.*?([0-9]*x[0-9]*)\s*[0-9]{2}\.[0-9][\s\*]\+', stdoutdata, flags=re.DOTALL)

subprocess.Popen(cmd)
