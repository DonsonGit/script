#!/bin/bash

for x in $(xrandr --listactivemonitors | awk '{print $4}')
do
	if [ $x != "" ]; then
		xrandr --output $x --brightness 0.8
	fi
done
