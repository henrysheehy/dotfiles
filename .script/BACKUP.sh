#!/bin/sh

# AUR packages
## The .packages are for general use.
## The .desktop-packages include additional files 
## related to Nvidia and Manjaro.
## The Manjaro files will be deleted in a future
## update if dependencies allow.
pacman -Qqe > "$HOME/.packages" 
cp "$HOME/.packages" "$HOME/.desktop-packages"
sed -i '/manjaro/d' "$HOME/.packages"
sed -i '/nvidia/d' "$HOME/.packages"
sed -i '/headers/d' "$HOME/.packages"
sed -i '/artwork-i3/d' "$HOME/.packages"
sed -i '/linux/d' "$HOME/.packages"
sed -i '/filesystem/d' "$HOME/.packages"
cat "$HOME/.packages" | vim -c "%j|wq" $HOME/.packages
cat "$HOME/.packages" | vim -c "%j|wq" $HOME/.desktop-packages

# Python pip packages
pip list | cut -f1 -d" " | sed '1,2d' > "$HOME/.pip" | vim -c "%j|wq" $HOME/.pip
