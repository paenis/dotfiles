#!/bin/sh
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

# load own Xresources
[ -f ~/.Xresources ] && xrdb ~/.Xresources

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

# start programs from xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# source xprofile
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# set wallpaper
~/.fehbg &

# set a random wallpaper:
# readarray -t w < <(ls WALLPAPER_DIR/)
# feh --bg-fill "WALLPAPER_DIR/${w[$(($RANDOM%${#w[@]}))]}"

# start picom in background
picom -b

# start wm
exec i3
