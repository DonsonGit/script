#!/bin/bash

dwm_battery() {
	CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)

	printf "%s" "$SEP1"
	if [ "$IDENTIFIER" = "unicode" ]; then

        if [ $CHARGE lt 100 ];then
			printf "%s%% %s" "$CHARGE" "$STATUS"
        fi
	else
        if [ "$CHARGE" -lt 20 ];then
			printf " %s%% %s" "$CHARGE"
        elif [ "$CHARGE" -lt 30 ];then
			printf " %s%% %s" "$CHARGE"
        elif [ "$CHARGE" -lt 40 ];then
			printf " %s%% %s" "$CHARGE"
        elif [ "$CHARGE" -lt 50 ];then
			printf " %s%% %s" "$CHARGE"
        elif [ "$CHARGE" -lt 60 ];then
			printf " %s%% %s" "$CHARGE"
        elif [ "$CHARGE" -lt 70 ];then
			printf " %s%% %s" "$CHARGE"
        elif [ $CHARGE -lt 80 ];then
			printf " %s%% %s" "$CHARGE"
        elif [ $CHARGE -lt 90 ];then
			printf " %s%% %s" "$CHARGE"
        elif [ $CHARGE -lt 100 ];then
			printf " %s%% %s" "$CHARGE"
        fi
	fi
	printf "%s\n" "$SEP2"
}
