#!/bin/bash

dwm_battery() {
	CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)

	printf "%s" "$SEP1"
	if [ "$IDENTIFIER" = "unicode" ]; then
		if [ "$STATUS" = "Charging" ]; then
			printf "CHG %s%% %s" "$CHARGE" "$STATUS"
		else
			printf "BAT %s%% %s" "$CHARGE" "$STATUS"
		fi
	else
		printf "BAT %s%% %s" "$CHARGE" "$STATUS"
	fi
	printf "%s\n" "$SEP2"
}
