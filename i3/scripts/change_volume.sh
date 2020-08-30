#!/bin/bash

NOTIFICATION_ID=9901
NOTIFICATION_TITLE='Volume'

if [[ $# -eq 1 && "$1" == '--help' ]]; then
    echo 'Usage:'
    echo "  $0              # display volume"
    echo "  $0 n%+|n%-|n%   # set volume"
    exit
elif [[ $# == 0 ]]; then
    vol_info=$(amixer get Master | awk 'END {print $5 $6}')
else
    vol_info=$(amixer set Master -M $@ | awk 'END {print $5 $6}')
fi

volume=$(echo "$vol_info" | sed 's/[^0-9]*//g')
output=$(echo "$vol_info" | sed 's/[^a-z]*//g')


notify_volume () {
    _timeout=2000
    /usr/bin/dunstify -u low -t $_timeout -h "int:value:$volume" \
        -r $NOTIFICATION_ID -- "$NOTIFICATION_TITLE" "$1"
}

if [[ "$output" == "off" ]] || [[ "$volume" == "0" ]]; then

    notify_volume '⧛⧛⧛⧛⧛⧛⧛⧛⧛⧛ MUTE ⧛⧛⧛⧛⧛⧛⧛⧛⧛⧛ 🔇'

else

    total_len=25
    fill_len=$[$volume * $total_len / 100]

    bar_str=''
    is_filled=0
    for i in $(seq 1 $total_len); do
        if [[ $is_filled -eq 1 ]]; then
            bar_str+='░'
        elif [[ $i -lt $fill_len ]]; then
            bar_str+='█'
        else
            bar_str+='⦀'
            is_filled=1
        fi
    done

    notify_volume "${bar_str} 🔊"

fi

