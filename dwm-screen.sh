#!/bin/sh

list=($(xrandr | grep ' connected' | awk '{print $1}'))

count=${#list[@]}

if [ $count == 3 ]; then
	xrandr --output DP-0 --mode 1920x1080 --rate 60 --pos 4480x0 --rotate left --output DP-1 --off --output HDMI-0 --primary --mode 2560x1440 --rate 60 --pos 1920x0 --rotate normal --output DP-2 --off --output DP-3 --off --output eDP-1-1 --mode 1920x1080 --rate 60 --pos 0x180 --rotate normal
elif [ $count == 2 ]; then
	xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 1920x1080 --rate 144 --pos 1920x0 --rotate normal --output DP-2 --off --output DP-3 --off --output eDP-1-1 --mode 1920x1080 --rate 144 --pos 0x0 --rotate normal
fi
