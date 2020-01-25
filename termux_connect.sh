if which termux-info
then 
	echo "found termux"
	#load wifi info
	termux-wifi-scaninfo
	ssid=$(termux-wifi-connectioninfo | jq ".ssid")
	if ["$ssid" = "Noisebridge"]
	then
		echo "on Noisebridge WAN, ENGAGE THE PARROTS"
		sh parrot.sh
	fi
fi
echo "did not find termux"
