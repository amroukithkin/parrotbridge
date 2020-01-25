#!/bin/bash

if which termux-info
then 
	while true
	do
		echo "found termux, looking for Noisebridge.."
		#load wifi info
		termux-wifi-scaninfo
		ssid=$(termux-wifi-connectioninfo | jq ".ssid" | xargs)
		if [ $ssid = "Noisebridge" ];
		then
			echo "on Noisebridge wifi.  Waiting 1 minute..."
			sleep 60
			sh parrot.sh
			break
		else
			echo "$ssid is not Noisebridge, waiting 30 secs and checking again."
		fi
	done
else
	echo "did not find termux :("
	break
fi
