#!/bin/sh

# AUR packages
pacman -Qqe > "$HOME/.packages" | vim -c "%j|wq" $HOME/.packages

# Python pip packages
pip list | cut -f1 -d" " | sed '1,2d' > "$HOME/.pip" | vim -c "%j|wq" $HOME/.pip
