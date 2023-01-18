#!/bin/sh
case "$1" in
    --toggle)
        governor=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | sed '2,$d')
        if [[ $governor == "powersave" ]] ; then
            echo `sudo cpupower frequency-set -g performance`
        fi
        if [[ $governor == "performance" ]] ; then
            echo `sudo cpupower frequency-set -g powersave`
        fi
        governor=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | sed '2,$d')
        notify-send "CPU: $governor" -t 5000
        ;;
    *)
    c=0;t=0

    awk '/MHz/ {print $4}' < /proc/cpuinfo | (while read -r i
    do
        t=$( echo "$t + $i" | bc )
        c=$((c+1))
    done
    echo "scale=2; $t / $c / 1000" | bc | awk '{print "  " $1" GHz"}')
    ;;
esac

