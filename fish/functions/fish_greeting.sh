#!/usr/bin/sh

cows=($(cowsay -l | sed 1d))
cowcnt=${#cows[*]}
cow=${cows[RANDOM % cowcnt]}

user_str="${USER}@$(hostname)"
date_str=$(date '+%Y.%m.%d %H:%M:%S')
greeting='Welcome, my owner!'
msg=$(echo -en "${user_str} \n ${date_str} \n ${greeting}")

cowsay -f $cow "$msg"

