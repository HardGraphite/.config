#!/usr/bin/sh

# battery info file
file_bat_cap='/sys/class/power_supply/BAT0/capacity'
file_bat_stat='/sys/class/power_supply/BAT0/status'

# battery capacity thresholds
bat_cap_th_norm=45 # 45
bat_cap_th_low=20 # 20
bat_cap_th_exl=10 # 10
bat_cap_th_dwn=5 # 5

# log
# args: %1-message
function log {
    echo "[$(date +%Y.%m.%d-%H:%M:%S)] $1"
}

# to display warning message
# args: %1-title, %2-message
function msgbox_warning {
    log "message box: $1"

    # printf '\t\t<span color="red">[ <b>%s</b> ]</span>\n\n%s\0' "$1" "$2" | xargs -i --null rofi -e "{}" -markup -width 32
    NOTIFICATION_ID=9902
    dunstify -a 'battery check' -u critical -r $NOTIFICATION_ID "$1" "$2 🔋"
}

# check interval
check_interval=1h

LF='
'

# check once
function check_bat_and_act {
    bat_cap=$(cat $file_bat_cap)
    bat_stat=$(cat $file_bat_stat)
    bat_info=$(printf '[%d%%, %s]' $bat_cap $bat_stat)

    # charging
    if [ "$bat_stat" = "Charging" ]; then
        if [ $bat_cap -gt $bat_cap_th_low ]; then
            if [ $check_interval != '1h' ]; then
                check_interval='1h'
            fi
        else
            if [ $check_interval != '15m' ]; then
                check_interval='15m'
            fi
        fi

    # discharging
    else
        # exhausted
        if [ $bat_cap -lt $bat_cap_th_dwn ]; then
            count_dwown_sec=15
            msgbox_warning 'Battery Exhausted' \
                "<big>😵</big> 啊我死了… ${LF}⏻ shut down in $count_dwown_sec seconds if not charged" &
            sleep $count_dwown_sec
            if [ "$bat_stat" != "Charging" ]; then
                log 'shutdown down for low battery'
                shutdown now
            fi

        # extremely low
        elif [ $bat_cap -lt $bat_cap_th_exl ]; then
            if [ $check_interval != '1m' ]; then
                check_interval='1m'
                msgbox_warning 'Very Low Battery Level' "<big>😞</big> 嘤嘤嘤～ 真的没电啦!!!${LF}$bat_info"
            fi

        # low
        elif [ $bat_cap -lt $bat_cap_th_low ]; then
            if [ $check_interval != '10m' ]; then
                check_interval='10m'
                msgbox_warning 'Low Battery Level' "<big>😒</big> 嘤嘤嘤～ 快要没电啦！${LF}$bat_info"
            fi

        elif [ $bat_cap -lt $bat_cap_th_norm ]; then
            if [ $check_interval != '15m' ]; then
                check_interval='15m'
            fi
        fi
    fi

    log "$bat_info, check_interval=$check_interval"
}


# checking loop
while true; do
    check_bat_and_act
    sleep $check_interval
done

