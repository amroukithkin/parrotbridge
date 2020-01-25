#!/bin/bash
$RANDOM=$$
if which termux-info
then 
	#init Parrot Nuisance Counter
	parrot_nuisance_count=0
	while true
	do
		echo "found termux, looking for Noisebridge.."
		#load wifi info, some SSIDs do not show up until you do an active scan
		termux-wifi-scaninfo > /dev/null
		ssid=$(termux-wifi-connectioninfo | jq ".ssid" | xargs)
		if [ $ssid = "Noisebridge" ];
		then
			if [ parrot_nuisance_count = 0 ]
			then
				duration=60
			else
				duration=$RANDOM
				let "duration %= 60"
			fi
			echo "on Noisebridge wifi.  Waiting $duration seconds..."
			sleep $duration
			sh parrot.sh
			if [ $; -gt 10 ];
			then
				break
			else
				let "parrot_nuisance_count+=1"
			fi
		else
			echo "$ssid is not Noisebridge, waiting 30 secs and checking again."
		fi
	done
else
	echo "did not find termux :("
	break
fi
