#!/bin/bash
#add this to your startup scripts via System Preferences / Users & Groups / Login items
ip=$(ifconfig | grep en0 -A99 | grep -w inet -m 1| awk -F' ' '{print $2}')
echo "ip is now $ip"
echo "address=/.test/$ip" > /usr/local/etc/dnsmasq.d/development.conf
networksetup -setdnsservers Wi-Fi $ip 8.8.8.8
sudo brew services restart dnsmasq
sleep 5
sudo killall -HUP mDNSResponder
curl http://hello.test
open -n -a "Firefox" --args "--new-window" "http://hello.test/web"

