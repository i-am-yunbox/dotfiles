#!/bin/bash

[[ "$(cat /sys/class/net/wlp1s0/operstate)" = 'down' ]] && echo -e " NO CONNECTION\n\n#d64937" && exit 0

interface="$(ip link show | grep -o "wlp1s0")"
essid="$(iwgetid -r)"
quality="$(grep wlp1s0 /proc/net/wireless | awk '{ print int($3 * 100/70) }')"
ip="$(ip addr show dev wlp1s0 | grep "scope global dynamic" | sed -e "s/^.* inet \(\S*\) .*$/\1/g")"
	
echo -e " $ip | $essid | $quality\n\n#8CFF20"



