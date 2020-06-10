#!/usr/bin/sh

workdir=$(dirname $0)

sleep 1
echo -e "1\n2\n" | rofi -dmenu -p 'Translate' | xargs -r "${workdir}/youdao_translate.py"

