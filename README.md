# Bash Script
Scripts for my daily use

## Tables of Content
- [autoscript](#autoscript)
- [comp](#comp)
- [dmenu](#dmenu)
- [dmenu](#dmenu)
- [ffyt](#ffyt)
- [lolban](#lolban)
- [mpd](#mpd)
- [optout](#optout)
- [pdfcomp](#pdfcomp)
- [reprog](#reprog)
- [shotgun](#shotgun)
- [ffgif](#ffgif)
- [ffimgaud](#ffimgaud)
- [ytclip](#ytclip)
- [dr](#dr)
- [ffconv](#ffconv)
- [ffrec](#ffrec)
- [finstall](#finstall)
- [gamelaucher](#gamelaucher)
- [gdrive](#gdrive)
- [livesetup](#livesetup)
- [sync](#sync)
- [gtt](#gtt)
- [colorgen](#colorgen)

## autoscript
This script creates new scripts and automatically makes the file executable. It has been copied from [Let's Linux #009](https://www.youtube.com/watch?v=QGUmMtEnIkI)

## comp
This script is used when working with Goff/Toff and Markdown. It will automatically convert the documents to PDF format. It is binding with my default text editor (nvim). It also handles python files
#### Requires
- pandoc (For Markdown to PDF)
- python (For Running python scripts)

## dmenu_launch
This is an application launcher using ls. It has an alternative using find to list applications. It is made due to dmenu_run being slow on my system.
#### Dependencies
- [dmenu](https://tools.suckless.org/dmenu)

## dmenu_playlist
This is add a music folder to the current playlist of mpd.
#### Dependencies
- mpc
- [dmenu](https://tools.suckless.org/dmenu)

## ffyt
This uses youtube-dl and ffplay to play youtube videos. You can add a second argument to specify quality. If nothing is inputted in the second argument the best quality will be picked
#### Dependencies
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- ffmpeg
- mpv
- vlc

## lolban
This converts text to ascii art. Purely for fun. It has been copied from [Let's Linux #009](https://www.youtube.com/watch?v=QGUmMtEnIkI)
#### Dependencies
- [toilet](https://github.com/cacalabs/toilet)
- [lolcat](https://github.com/busyloop/lolcat)
- [fonts](https://github.com/xero/figlet-fonts) (Move it to **/usr/share/figlet**)

## mpd_control
This control the mpd. You can see the current song, pause, next, previous, and [add](#dmenu_playlist) to mpd.
#### Dependencies
- [dmenu](https://tools.suckless.org/dmenu)
- mpd

## optout
This script opens the output of [comp](#comp) from the default editor(nvim).

## pdfcomp
This attempt to combine PDF files together. There is a bug when combining PDF file with spaces in their file name. It has options of `-low`, `-high`, and `-comp`. `-low` outputs the lowest acceptable resolution. `-high` output the highest acceptable resolution. `-comp` is the compressed version of PDF. If no option has be inputted it will a normal PDF combination. Combining files with no option may results in pages not having the same size.
#### Dependencies
- ghostscript

## reprog
This killall an application and launches it again. I used this when experimenting with picom settings.

## shotgun-area
This script is a fork of the script shown in the [shotgun github](https://github.com/neXromancers/shotgun). I have added the feature of saving files with the option `-s`.
#### Dependencies
- [shotgun](https://github.com/neXromancers/shotgun)
- [slop](https://github.com/naelstrof/slop)

## ffgif
This script will turn a video into a gif in the highest quality
#### Dependencies
- ffmpeg

## ffimgaud
This script will combine a single image and a single audio together
Great for making sound images into a video
#### Dependencies
- ffmpeg

## ytclip
ytclip is a simple video trimming program
I use this to make clips fast during livestreams
#### Dependencies
- ffmpeg
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)

## dr
A dragon-drag-and-drop wrapper that supports links
#### Dependencies
- [dragon-drag-and-drop](https://github.com/mwh/dragon)

## ffconv
Quickly converts one video format to another
#### Dependencies
- ffmpeg

## ffrec
A forked version of [rec.sh](https://github.com/SPDUK/screen-recorder-script/blob/master/recorder.sh). I have added the the feature of selecting a windows to record.
#### Dependencies
- ffmpeg
- xorg-xwininfo
- [slop](https://github.com/naelstrof/slop)

## finstall
Auto-install and reload of fonts. It stores the fonts in $HOME/.local/share/fonts

## gamelaucher
It is a gamelaucher using dmenu. It stores a list of games in $HOME/.cache/gamelaucher-bash/ . 
#### Dependencies
- [dmenu](https://tools.suckless.org/dmenu)
### Examples:
Adding games:
```
gamelaucher add <alias> <launch command>
```
Removing games:
```
gamelaucher rm <alias>
```

## gdrive-dl
Download public google drive files. It supports files and folders and has interactive interface with complex file selection. 
#### Dependencies
- curl

## livesetup
It uses mpv(video) and brave(chat) to watch livestream. It supports upcoming videos. 
#### Dependencies
- mpv
- socat
- curl
### Examples
launch normally
```
livesetup <streamer>
```
add a new streamer. The `<link>` must be a live link (e.g. `https://www.youtube.com/channel/XXXXXXXXX/live`, `https://www.twitch.tv/XXXXXXXX`)
```
livesetup add <streamer> <link>
```
remove a streamer
```
livesetup rm <streamer>
```
list all streamers
```
livesetup ls
```

## sync-server
Sets up my sync server to my current IP.
#### Dependencies
- rclone

## gtt
Combines my commonly used git commands. It executes the commands in order.
#### Dependencies
- git
### Examples
add a file
```
gtt -a <file>
```
add all files
```
gtt -A
```
add files and then commit a message
```
gtt -a <file> -cm <message>
```
view differences
```
git -d
```
check status
```
git -s
```
push changes to github
```
gtt -p
```

## colorgen
Generates a color map based on the image given.
```
colorgen <Image> [fuzziness] [number of colors]
```
#### Dependencies
- magick
### Examples
Launching Normally
```
colorgen <Image>
```
Setting the fuzziness of the color generation to 60%
```
colorgen <Image> 60
```
Get 10 different colors
```
colorgen <Image> 30 10
```
