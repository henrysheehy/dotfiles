#!/bin/sh

progress="Nothing"

case "$1" in
    --power)
        power=$(echo $(sed -n '3p' $HOME/.cache/.rsnapshot | cut -d ':' -f2))
        if [[ $power == "shutdown" ]] ; then
          power="do nothing"
        elif [[ $power == "suspend" ]] ; then
          power="shutdown"
        else [[ $power == "do nothing" ]]
          power="suspend"
        fi
        notify-send "After backup $power" -t 5000
        sed -i '3s/.*/power:'$power/ $HOME/.cache/.rsnapshot
      ;;
    *)
esac
case "$1" in
    --click)
        progress=$(echo $(sed -n '4p' $HOME/.cache/.rsnapshot | cut -d ':' -f2))
        if $progress ; then
          notify-send "Backup already underway..." -t 5000
        else
          notify-send "Starting backup" -t 5000
          progress=true

        sed -i '4s/.*/in-progress:'$progress/ $HOME/.cache/.rsnapshot

        sudo rsnapshot -v alpha

        sleep 2s

        wait

        notify-send "Backup done" -t 5000

        progress="Nothing"

        power=$(echo $(sed -n '3p' $HOME/.cache/.rsnapshot | cut -d ':' -f2))

        echo "$(date +%Y-%m-%d\ %H-%M-%S)
$(date +%s)
power:do nothing
in-progress:false" > $HOME/.cache/.rsnapshot

        if [[ $power == "suspend" ]]; then
          echo "$(blurlock; systemctl suspend)"
        elif [[ $power == "shutdown" ]]; then
          echo "$(systemctl shutdown)"
        fi

      fi

      ;;
    *)

  progress=$(echo $(sed -n '4p' $HOME/.cache/.rsnapshot | cut -d ':' -f2))
    if $progress ; then
      echo "In progress..."
      exit
    fi

    num1=$(echo $(sed -n '2p' $HOME/.cache/.rsnapshot))
    num2=$(date +%s)
    time=$(echo "$(($num2-$num1))")
    if [ $time -lt 60 ]; then
      echo Last backup $(($time))s ago
    elif [ $time -gt 60 ]; then
      echo Last backup $(($time/60))m ago
    elif [ $time -gt 3600 ]; then
      echo Last backup $(($time/3600))h ago
    else [ $time -gt 172800 ]
      echo Last backup $(($time/86400)) days ago
    fi
    ;;
esac

