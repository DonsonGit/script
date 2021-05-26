#!/bin/bash

echo "enter a Wifi name:"
read name
if [ $name == "" ];then
	echo "invalid name! exit"
	return 1
fi

read password

nmcli device wifi connect $name password $password name $name
