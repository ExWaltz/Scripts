#!/bin/bash
if pidof ffmpeg
  then
    killall ffmpeg

    notify-send 'Stopped Recording!' --icon=dialog-information
  else 
    time=$(date +%y%b%d%H%M%S)
    case $1 in
        -w)
            wininfo=$(xwininfo)
            width=$(printf "%s" "$wininfo" | awk '/Width/' | grep -oP "\d\d?\d?\d?\d?")
            height=$(printf "%s" "$wininfo" | awk '/Height/' | grep -oP "\d\d?\d?\d?\d?")
            xpos=$(printf "%s" "$wininfo" | awk '/Absolute/ && /X:/' | grep -oP "\d\d?\d?\d?\d?")
            ypos=$(printf "%s" "$wininfo" | awk '/Absolute/ && /Y:/' | grep -oP "\d\d?\d?\d?\d?")

            notify-send 'Started Recording!' --icon=dialog-information

            ffmpeg -f x11grab -s "$width"x"$height" -framerate 60 -thread_queue_size 512 -i $DISPLAY.0+$xpos,$ypos -vcodec libx264 -qp 18 -preset ultrafast ~/Videos/recording-$time.mp4
            ;;
        *)
            slop=$(slop -f "%x %y %w %h")

            read -r X Y W H < <(echo $slop)



            # only start recording if we give a width (e.g we press escape to get out of slop - don't record)
            width=${#W}

            if [ $width -gt 0 ];
             then
              notify-send 'Started Recording!' --icon=dialog-information
              
              # records without audio input
              # for audio add "-f alsa -i pulse" to the line below (at the end before \, without "")
              ffmpeg -f x11grab -s "$W"x"$H" -framerate 60  -thread_queue_size 512  -i $DISPLAY.0+$X,$Y \
               -vcodec libx264 -qp 18 -preset ultrafast \
               ~/Videos/recording-$time.mp4
            fi
            ;;
    esac
fi

