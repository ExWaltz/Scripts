# Bash Script
Scripts for my daily use

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
- dmenu

## dmenu_playlist
This is add a music folder to the current playlist of mpd.
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

## ffgif
This script will turn a video into a gif in the highest quality
#### Dependencies
- ffmepg

## ffimgaud
This script will combine a single image and a single audio together
Great for making sound images into a video
#### Dependencies
- ffmepg

## ytclip
ytclip is a simple video trimming program
I use this to make clips fast during livestreams
#### Dependencies
- ffmpeg
- youtube-dl

## nasfaq
This script is only useful for people who play at [nasfaq](https://nasfaq.biz/)
What this script does is send buy or sell commands to the nasfaq api
#### Tutorial
`nasfaq [buy|sell] Name of coin [holosession]`

1. `holosession` can be set using the `HOLOSESSION` variable
1. To find holosession first go to [nasfaq](https://nasfaq.biz/)
1. then right click and click on `Inspect`
1. after that click on the `Network` tab
1. on the filter search bar type `api`
1. then back on [nasfaq](https://nasfaq.biz/) click on the `Activity` tab
1. You should find `getHistory` file. If you don't see it, refresh the page
1. Click on the `getHistory` file and scroll down until you get to the `Request Headers` section
1. Click on `View source` and copy the line that starts with `Cookie:`
1. One you copied the line execute this command on the terminal or include it in you `~/.bashrc` file to avoid executing the command everytime
`export HOLOSESSION="<The line that starts with Cookie>"`
#### Examples
This one sells ayame coin: `nasfaq sell ayame`
This one buy ayame coin: `nasfaq buy ayame`
#### Dependencies
- curl
#### Extra notes
Here is the complete name list: 
```
aki
amelia
aqua
ayame
ayamy
azki
botan
calliope
choco
civia
coco
flare
fubuki
gura
haato
himemoriluna
hololive
inanis
iofi
kanata
kiara
korone
lamy
marine
matsuri
mel
melfissa
miko
mio
moona
nana
nene
noel
okayu
ollie
pekora
pochimaru
polka
reine
risu
roboco
rushia
shion
sora
subaru
suisei
towa
ui
watame
```
