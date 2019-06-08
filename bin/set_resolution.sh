#!/bin/bash

xrandr_output=$(xrandr -q)
edp1_connected=$(echo "$xrandr_output" | grep "^eDP-1 connected")
hdmi1_connected=$(echo "$xrandr_output" | grep "^HDMI-1 connected")
dp1_connected=$(echo "$xrandr_output" | egrep "^DP-1 connected")
dp2_connected=$(echo "$xrandr_output" | grep "^DP-2 connected")

if [[ ! -z "$hdmi1_connected" && ! -z "$dp2_connected" ]]; then
    # HDMI-1 and DP-2 connected
    xrandr --output eDP-1 --off --output HDMI-1 --auto --primary --output DP-2 --rotate left --right-of HDMI-1
    exit
elif [[ ! -z "$dp1_connected" && ! -z "$dp2_connected" ]]; then
    # HDMI-1 and DP-2 connected
    xrandr --output eDP-2 --off --output DP-2 --auto --primary --output DP-1 --rotate left --right-of DP-2
    exit
elif [[ ! -z "$hdmi1_connected" ]]; then
    # Only HDMI connected
    xrandr --output eDP-1 --off --output HDMI1 --auto
    exit
elif [[ ! -z "$dp1_connected" ]]; then
    # Only DP-1 connected
    xrandr --output eDP-1 --off --output DP-1 --auto
elif [[ ! -z "$dp2_connected" ]]; then
    # Only DP-2 connected
    xrandr --output eDP-1 --off --output DP-2 --auto
    exit
fi
