#!/bin/bash
INTERFACE=$(ip link show | grep -o "enp2s0")
ADDR=$(ip addr show dev $INTERFACE | grep "global $INTERFACE" | awk '{print $2}')
if [[ "$ADDR" == "" ]]; then
    echo -e " NO CONNECTION\n\n#d64937"
else
    if [[ $(ip route show | sed -n '1,1p' | grep $INTERFACE) != "" ]]; then
        echo -e " ${ADDR} (route)\n\n#8CFF2D"
    else
        echo -e " ${ADDR}\n\n#8CFF2D"
    fi
fi
