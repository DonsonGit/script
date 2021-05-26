#!/bin/bash

list=`nmcli device wifi list | cut -c9- | awk '{if ($2 != "--") print $2}'`

for x in $(nmcli connection show | awk '{if ($3 == "wifi") print $1}')
do
	for xw in $list
	do
		if [ $xw == $x ]; then
			nmcli connection up $xw
			exit 0
		fi
	done
done

exit 1

