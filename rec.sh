#!/bin/bash
option=$(printf "%s\n%s\n%s" "rectangle" "window" "gif" | dmenu -i -p "🔴 Recording Option")
[ -z "$option" ] && exit
if pidof ffmpeg
  then
      killall ffmpeg
      notify-send 'Stopped Recording!' --icon=dialog-information
  else 
    time=$(date +%y%b%d%H%M%S)
    case $option in
        -w|window)
            wininfo=$(xwininfo)
            width=$(printf "%s" "$wininfo" | awk '/Width/' | grep -oP "\d\d?\d?\d?\d?")
            height=$(printf "%s" "$wininfo" | awk '/Height/' | grep -oP "\d\d?\d?\d?\d?")
            xpos=$(printf "%s" "$wininfo" | awk '/Absolute/ && /X:/' | grep -oP "\d\d?\d?\d?\d?")
            ypos=$(printf "%s" "$wininfo" | awk '/Absolute/ && /Y:/' | grep -oP "\d\d?\d?\d?\d?")

            notify-send 'Started Recording!' --icon=dialog-information

            ffmpeg -probesize 20M -f x11grab -s "$width"x"$height" -fflags +genpts -re \
                -framerate 60 -thread_queue_size 1024 -i $DISPLAY.0+$xpos,$ypos -pix_fmt yuv420p -vsync 1 \
                -vcodec libx264 -crf 28 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
                -tune film -qp 18 -preset ultrafast -g 30 -x264opts no-scenecut ./recording-$time.ts
                # -f pulse -i 'alsa_output.pci-0000_00_0e.0.analog-stereo.monitor' \
                # -c:a aac -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" \
                # -map 0:v:0 -map 1:a \
            # notify-send "Processing Video"
            #   ffmpeg -i ~/Videos/.tmp-recording-$time.ts \
            #       -c:v copy -c:a copy -avoid_negative_ts make_zero \
            #       -shortest -movflags +faststart -bsf:a aac_adtstoasc -f mp4 \
            #       ~/Videos/recording-$time.mp4
            #   rm ~/Videos/.tmp-recording-$time.ts
            # notify-send "Done Processing Video"
            ;;
        -g|gif)
            slop=$(slop -f "%x %y %w %h")

            read -r X Y W H < <(echo $slop)



            # only start recording if we give a width (e.g we press escape to get out of slop - don't record)
            width=${#W}

            if [ $width -gt 0 ];
             then
              notify-send 'Started Recording!' --icon=dialog-information
              
              # records without audio input
              # for audio add "-f alsa -i pulse" to the line below (at the end before \, without "")
              vidTempFile=".temp-$time.mp4"
              ffmpeg -probesize 20M -f x11grab -s "$W"x"$H" -framerate 60  -thread_queue_size 512  -i $DISPLAY.0+$X,$Y \
               -pix_fmt yuv420p -y -vcodec libx264 -qp 18 -preset ultrafast -tune film -g 30 -crf 28 \
               -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
               ~/Videos/.temp-video.mp4
              printf "%s" $vidTempFile
            notify-send "Processing Video"
              ffmpeg -i  ~/Videos/.temp-video.mp4 \
               -vf "fps=30,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
               ~/Videos/recording-$time.gif
              rm ~/Videos/.temp-video.mp4
            notify-send "Done Processing Video"
            fi
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
              ffmpeg -probesize 20M -f x11grab -s "$W"x"$H" \
                  -framerate 60  -thread_queue_size 1024  -i $DISPLAY.0+$X,$Y \
                  -f pulse -i 'alsa_output.pci-0000_00_0e.0.analog-stereo.monitor' -pix_fmt yuv420p -vsync 1 \
                  -vcodec libx264 -crf 28 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
                  -tune film -qp 18 -preset ultrafast -g 30 -x264opts no-scenecut \
                  -c:a aac -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" \
                  -map 0:v:0 -map 1:a \
                  ~/Videos/.tmp-recording-$time.ts
            notify-send "Processing Video"
              ffmpeg -i ~/Videos/.tmp-recording-$time.ts \
                  -c:v copy -c:a copy -avoid_negative_ts make_zero \
                  -shortest -movflags +faststart -bsf:a aac_adtstoasc -f mp4 \
                  ~/Videos/recording-$time.mp4
              rm ~/Videos/.tmp-recording-$time.ts
            notify-send "Done Processing Video"
            fi
            ;;
    esac
fi

