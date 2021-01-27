# Bash Script
Scripts for my daily use

## autoscript
This script creates new scripts and automatically makes the file executable. It has been copied from [Let's Linux #009](https://www.youtube.com/watch?v=QGUmMtEnIkI)

## comp
This script is used when working with Goff/Toff and Markdown. It will automatically convert the documents to PDF format. It is binding with my default text editor (nvim). It also handles python files
#### Requires
- pandoc (For Markdown to PDF)
- python (For Running python scripts)

## deskls
This is an attempt to list all the desktop file by names. Currently not working. Planning to fix it in the future (Low Priority)

## dmenu_launch
This is an application launcher using ls. It has an alternative using find to list applications. It is made due to dmenu_run being slow on my system.
#### Dependencies
- dmenu

## dmenu_playlist
This is add a folder to the current playlist of mpd.
#### Dependencies
- mpc
- dmenu

## ffyt
This uses youtube-dl and ffplay to play youtube videos. You can add a second argument to specify quality. If nothing is inputted in the second argument the best quality will be picked
#### Dependencies
- youtube-dl
- ffmpeg

## lolban
This converts text to ascii art. Purely for fun. It has been copied from [Let's Linux #009](https://www.youtube.com/watch?v=QGUmMtEnIkI)
#### Dependencies
- toilet
- lolcat
- [fonts](https://github.com/xero/figlet-fonts) (Move it to **/usr/share/figlet**)

## mpd_control
This control the mpd. You can see the current song, pause, next, previous, and [add](#dmenu_playlist) to mpd.
#### Dependencies
- dmenu
- mpd

## optout
This script opens the output of [comp](#comp) from the default editor(nvim).

## pdfcomp
This attempt to combine PDF files together. There is a bug when combining PDF file with spaces in their file name. It has options of `-low`, `-high`, and `-comp`. `-low` outputs the lowest acceptable resolution. `-high` output the highest acceptable resolution. `-comp` is the compressed version of PDF. If no option has be inputted it will a normal PDF combination. Combining files with no option may results in pages not having the same size.
#### Dependencies
- ghostscript

## rec.sh
A forked version of [rec.sh](https://github.com/SPDUK/screen-recorder-script/blob/master/recorder.sh). I have added the the feature of selecting a windows to record.
#### Dependencies
- xorg-xwininfo (Selecting windows to record)

## reprog
This killall an application and launches it again. I used this when experimenting with picom settings.

## shotgun-area
This script is a fork of the script shown in the [shotgun github](https://github.com/neXromancers/shotgun). I have added the feature of saving files with the option `-s`.
#### Dependencies
- shotgun
- slop

