#!/bin/bash

nmcli connection up hortor-vpn

if [ "$1" == "" ]; then
	./vpn-router.sh
fi
