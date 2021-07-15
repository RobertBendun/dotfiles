#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Make Caps Lock useful
setxkbmap -option caps:escape
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock

# Change keys speed rate
xset r rate 300 50

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xsetroot -solid '#34495e'
# xcompmgr &
setxkbmap pl
xwallpaper --zoom .config/wall.png
dwmblocks & # my custom build of dwmblocks
exec dwm
