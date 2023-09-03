#!/usr/bin/sh
`sh ~/.config/i3/scripts/ws_check.sh 4` && { alacritty -e ranger $PROJ/testbed/LaTeX/ & alacritty -e htop ; }
exit
