#!/bin/sh

# Reset rsnapshot polybar plugin

echo "Last action: $(date +%Y-%m-%d\ %H-%M-%S)
$(date +%s)
power:do-nothing
in-progress:false" > $HOME/.cache/.rsnapshot

notify-send "Reset rsnapshot polybar plugin"

