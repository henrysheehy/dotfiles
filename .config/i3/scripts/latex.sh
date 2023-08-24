#!/usr/bin/sh
if `sh ~/.config/i3/scripts/ws_check.sh LaTeX`
then
    exit
else
    alacritty --working-directory ~/Projects/multiorbital-superconductivity/06-thesis &
    alacritty -e ranger ~/Projects/multiorbital-superconductivity/06-thesis/ &
fi
exit
