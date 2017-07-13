#!/bin/bash
STATUS=$(cat /sys/class/power_supply/BAT0/status)
REMAIN=$(cat /sys/class/power_supply/BAT0/capacity)
LOG="/tmp/i3blocks-battery.log"

if [[ -f $NOTIFY ]]; then
    st=$(cat $LOG | cut -d : -f 1)
    rem=$(cat $LOG | cut -d : -f 2)
    notified=$(cat $LOG | cut -d : -f 3)
    if (( $notified < 1 )) && [[ $STATUS = "Discharging" ]] && (( $remain < 20 )); then
        notify-send -u critical "LOW BATTERY WARNING" "battery < 20%" && notified=1
    elif (( $notified < 1 )) && [[ $STATUS = "Charging" ]] && [[ $st = "Discharging" ]]; then
        notify-send "BATTERY INFORMATION" "CHARGING..." && notified=1
    fi
else
    notified=0
fi

echo "${STATUS}:${REMAIN}:${notified}" > $LOG
if [[ ${STATUS} = "Discharging" ]]; then
    STATUS=DISCHARGING
    remain=$(( $(echo $REMAIN | sed -e 's/\.[0-9]*$'//g) + 0 ))
    (( $remain > 60 )) && echo -e " ${STATUS}   ${REMAIN}%\n\n#d64937" || \
    (( $remain > 20 )) && echo -e " ${STATUS}   ${REMAIN}%\n\n#d64937" || \
    echo -e " ${STATUS}   ${REMAIN}%\n\n#FE2E2E"
elif [[ ${STATUS} = "Full" ]]; then
    STATUS=FULL
    echo -e " ${STATUS}\n\n" && notified=1
else 
    STATUS=CHARGING
    echo -e " ${STATUS}   ${REMAIN}%\n\n#d64937"
    notified=0
fi
