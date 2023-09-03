#!/usr/bin/sh
################################################
#        * workspace check for i3wm *          #
#             Henry Joseph Sheehy              #
#          Copyright September 2023            #
#               GNU 2.0 License                #
################################################
# check if input is in focus; if true; return ws number
## Get workspace number of currently focused window
foc=`wmctrl -d | grep '[*]' | awk '{print $9}'`
## If specified window is not in focus, exit
[[ $foc != $1 ]] && { echo false ; exit ; }
## Bug testing:
# notify-send "In focus"
## If the specified workspace is not empty, exit
spec=`wmctrl -d | grep "N/A  $1" | awk '{print $1}'`
spec=`wmctrl -l | awk '{print $2}' | grep "$spec" | grep -v -` 
## Bug testing:
# notify-send "Specified workspace $spec"
# notify-send ${#spec}
[[ ${#spec} -gt 0 ]] && { echo false ; exit ; }
## Bug testing:
# notify-send "Empty"
echo true
exit
