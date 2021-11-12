#!/bin/bash

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# touchpad scorll horization
id=`xinput --list | grep "Touchpad" | cut -d '=' -f2 | cut -d '[' -f1`
scroll_id=`xinput --list-props ${id} | grep "Two-Finger Scrolling" | cut -d '(' -f2 | cut -d ')' -f1`
xinput --set-prop $id $scroll_id 1 1

# touchpad tap action
tap_id=`xinput --list-props ${id} | grep "Tap Action" | cut -d '(' -f2 | cut -d ')' -f1`
xinput --set-prop $id $tap_id 1 1 1 1 1 1

# more monitor
bash $DIR/dwm-screen.sh

# brightness
bash $DIR/dwm-brightness.sh

# wall paper
while true
do
	bash $DIR/dwm-bg.sh
	sleep 50m
done &

# open bluetooth
bluetooth on
dunstify -u normal -a "Bluetooth" " Bluetooth on "

# power manager
xfce4-power-manager --daemon

# compositor
picom -b

# dwm window manager name tool
wmname LG3D

# networkmanager and dwm-status
# wifi_up=0
while true
do
	# if (($wifi_up == 0)); then
		# dunstify -u normal -a "WIFI" " Initial WIFI... "
		# wifi_up=1
		# res=$(bash $DIR/dwmbar-functions/dwm_wifi.sh)
		# if (($res > 0));then 
			# dunstify -u critical -a "WIFI" " WIFI connected failed "
			# sleep 10
		# fi
		# dunstify -u normal -a "WIFI" " WIFI connected "
	# fi
	sleep 3
	bash $DIR/dwm-status-refresh.sh
done &

sleep 5
bash $DIR/dwm-fcixt5.sh
