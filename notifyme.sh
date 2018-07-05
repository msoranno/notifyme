#!/bin/bash
NOW=`date '+%Y-%m-%d %H:%M:%S'`
myIP=`curl -s ipecho.net/plain`
from_mail="metheman.here@gmail.com"
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
			mail -aFrom:$from_mail -s "Ha cambiado la ip $NOW" $1 <<< "$NOW Ahora es: $myIP"
		fi
	else
		echo "$NOW -- first execution"
		echo $myIP > current.txt
		mail -aFrom:$from_mail -s "First exec..Ha cambiado la ip $NOW" $1 <<< "$NOW Ahora es: $myIP"
	fi
fi
