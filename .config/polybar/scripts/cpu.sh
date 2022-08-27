#!/bin/sh
case "$1" in
    --popup)
        notify-send "CPU time (%)" "$(ps axch -o cmd:10,pcpu k -pcpu | head | awk '$0=$0"%"' )" -t 10000
        ;;
    *)
        echo " $(sensors | grep Package | head -1 | awk '{print $4}')"
        ;;
esac
