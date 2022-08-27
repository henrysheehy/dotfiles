#!/usr/bin/bash
if `bash ~/.config/i3/scripts/ws_check.sh 10`
then
    exit
else
    spotify &
    alacritty -e cava &
fi
exit
