#!/bin/bash

myIP=`curl -s ipecho.net/plain`
status=$?
if [ $status -gt 0 ]; then
	echo "Something wrong"
else
	if [ -f current.txt ]; then
		currentIp=`cat current.txt`
		if [ $myIP == $currentIp ]; then
			echo "Same ip. Nothing to do -- $myIP"
		else
			echo "Ip has changed... sending notification"
			mail -s "Ha cambiado la ip" $1 <<< "Ahora es: $myIP"
		fi
	else
		echo "first execution"
		echo $myIP > current.txt
		mail -s "First exec..Ha cambiado la ip" $1 <<< "Ahora es: $myIP"
	fi
fi
