#!/usr/bin/bash
if `bash ~/.config/i3/scripts/ws_check.sh Development`
then
    :
else
    alacritty -e ranger ~/Projects/multiorbital-superconductivity/01-main/ &
    alacritty -e ranger ~/Projects/multiorbital-superconductivity/01-main/ &
fi
exit
