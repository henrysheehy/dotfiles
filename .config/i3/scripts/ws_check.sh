#!/usr/bin/bash
# check if input is in focus; if true; return ws number
foc=`wmctrl -d | grep $1 | awk '{print $2}'`
if [[ $foc == "*" ]]; then
    ((tmp+=1))
    foc=`wmctrl -d | grep $1 | awk '{print $1}'`
else
    :
fi
# array length is the number of windows in given ws
ar=(`wmctrl -l | awk '{print $2}' | grep $foc`)
if [ ${#ar[@]} -le 0 ]; then
    ((tmp+=1))
fi
if [ $tmp -eq 2 ]; then
    echo false
else
    echo true
fi
