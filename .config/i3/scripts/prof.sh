#!/usr/bin/bash
if `bash ~/.config/i3/scripts/ws_check.sh Profiling`
then
    exit
else
    alacritty --working-directory ~/Projects/multiorbital-superconductivity/01-main &
    alacritty -e htop &
fi
exit
