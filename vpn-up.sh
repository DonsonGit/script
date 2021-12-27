#!/bin/bash

if ! nmcli connection up hortor-vpn; then
    echo "connect to hortor-vpn failed"
fi

if [ -z "$WIFI_NAME" ]; then
    exit 0
fi

active_wifi=$(nmcli con show --active | grep "$WIFI_NAME")
if [ ! -z "$active_wifi" ]; then
	./vpn-router.sh
fi
