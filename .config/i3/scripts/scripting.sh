#!/usr/bin/sh
if `sh ~/.config/i3/scripts/ws_check.sh Scripting`
then
    :
else
    alacritty -e ranger Projects/multiorbital-superconductivity/01-main/ &
    alacritty -e ranger Projects/multiorbital-superconductivity/01-main/ &
fi
exit
