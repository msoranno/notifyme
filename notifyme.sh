#!/bin/bash
NOW=`date '+%Y-%m-%d %H:%M:%S'`
myIP=`curl -s ipecho.net/plain`
status=$?
if [ $status -gt 0 ]; then
	echo "$NOW -- Something wrong"
else
	if [ -f current.txt ]; then
		currentIp=`cat current.txt`
		if [ $myIP == $currentIp ]; then
			echo "$NOW -- Same ip. Nothing to do -- $myIP"
		else
			echo "$NOW -- Ip has changed- $myIP  ... sending notification"
			echo $myIP > current.txt
			mail -s "Ha cambiado la ip" $1 <<< "Ahora es: $myIP"
		fi
	else
		echo "$NOW -- first execution"
		echo $myIP > current.txt
		mail -s "First exec..Ha cambiado la ip" $1 <<< "Ahora es: $myIP"
	fi
fi
