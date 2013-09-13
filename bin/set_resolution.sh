#!/bin/bash

xrandr -q | grep "VGA1 connected" && xrandr --output LVDS1 --off --output VGA1 --auto
xrandr -q | grep "HDMI1 connected" && xrandr --output LVDS1 --off --output HDMI1 --auto
