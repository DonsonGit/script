#!/bin/bash

list=`xrandr --listactivemonitors | awk '{if ($4 != "") print $4}'`

cur_monitor=""

for x in $list
do
	if [ cur_monitor == "" ];then
		cur_monitor=$x
	else
		xrandr --auto --output $x --right-of $cur_monitor --size 1920x1080
	fi
done
