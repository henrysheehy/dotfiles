#!/bin/sh

# Push user-defined keyboard into xkb keyboard directory
sudo rsync -a $HOME/.config/.keyboard /usr/share/X11/xkb/symbols/user
