#!/user/bin/bash
if `bash ~/.config/i3/scripts/ws_check.sh Config`
then
    :
else
    alacritty -e ranger ~/Projects/multiorbital-superconductivity/02-conf/ &
    alacritty -e ranger ~/Projects/multiorbital-superconductivity/02-conf/ &
fi
exit
