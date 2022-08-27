#!/usr/bin/bash
if `bash ~/.config/i3/scripts/ws_check.sh `
then
    exit
else
    exec firefox &
    exec blueman-applet &
fi
exit
