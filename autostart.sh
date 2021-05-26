#!/bin/bash

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# wall paper
bash $DIR/dwm-bg.sh

#touchpad scorll horization
id=`xinput --list | grep "Touchpad" | cut -d '=' -f2 | cut -d '[' -f1`
scroll_id=`xinput --list-props ${id} | grep "Two-Finger Scrolling" | cut -d '(' -f2 | cut -d ')' -f1`
xinput --set-prop $id $scroll_id 1 1

# touchpad tap action
tap_id=`xinput --list-props ${id} | grep "Tap Action" | cut -d '(' -f2 | cut -d ')' -f1`
xinput --set-prop $id $tap_id 1 1 1 1 1 1

# more monitor
# ./dwmbar-functions/dwm_monitor.sh
# xrandr --output eDP-1-1 --off

# power manager
xfce4-power-manager --daemon

# compositor
picom -b

# dwm window manager name tool
wmname LG3D

xsetroot -name " initial wifi... "

# networkmanager and dwm-status
wifi_up=0
while true
do
	if (($wifi_up == 0)); then
		wifi_up=1
		res=$(bash $DIR/dwmbar-functions/dwm_wifi.sh)
		if (($res > 0));then 
			xsetroot -name " wifi connected failed!!! "
			sleep 10
		fi
		xsetroot -name " wifi is connected "
	fi
	bash $DIR/dwm-status-refresh.sh
	sleep 3
done &

