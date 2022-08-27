#!/usr/bin/bash
if `bash ~/.config/i3/scripts/ws_check.sh Notes`
then
    :
else
    alacritty -e ranger ~/Documents
fi
exit
