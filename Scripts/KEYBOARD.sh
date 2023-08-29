#!/bin/sh

# Push user-defined keyboard into xkb keyboard directory
sudo rsync -a $HOME/.keyboard /usr/share/X11/xkb/symbols/user
