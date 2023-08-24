#!/bin/sh
current=`setxkbmap -query | grep layout|cut -d ':' -f 2|cut -d ',' -f 2`
echo $current
if [ "$current" == "ru" ]
then 
    notify-send -t 500 -i keyboard "Keyboard layouts: GB/MATH"
    setxkbmap -option 'lv3:alt_switch,grp:rwin_toggle' -layout 'us,math' -variant 'intl,basic' 
else 
    notify-send -t 500 -i keyboard "Keyboard layouts: RU/GB"
    setxkbmap -option 'lv3:alt_switch,grp:rwin_toggle' -layout 'us,ru' -variant 'intl,phonetic_winkeys' 
    xkb-switch -n
    # sudo systemctl disable --now udevmon.service
    # sudo systemctl enable --now udevmon.service
    # sudo systemctl start udevmon.service
fi
