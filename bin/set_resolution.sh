#!/bin/bash

xrandr -q | grep "VGA1 connected" && xrandr --output LVDS1 --off --output VGA1 --auto
xrandr -q | grep "HDMI1 connected" && xrandr --output LVDS1 --off --output HDMI1 --auto

# enable monitor & vertical monitor
xrandr --output LVDS1 --off --output HDMI1 --auto --output VGA1 --auto --rotate left --right-of HDMI1
# enable monitor & disable vertical monitor
xrandr --output LVDS1 --off --output HDMI1 --auto --output VGA1 --off
