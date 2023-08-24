#!/usr/bin/sh
if `sh ~/.config/i3/scripts/ws_check.sh Notes`
then
    :
else
    alacritty -e ranger ~/Documents
fi
exit
