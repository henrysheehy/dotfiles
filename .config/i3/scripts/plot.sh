#!/usr/bin/sh
if `sh ~/.config/i3/scripts/ws_check.sh Plotting`
then
    :
else
    alacritty -e ranger ~/Projects/multiorbital-superconductivity/04-plot &
    alacritty --working-directory ~/Projects/multiorbital-superconductivity/04-plot &
fi
exit
