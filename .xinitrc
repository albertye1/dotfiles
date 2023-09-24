#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

picom -b &
feh --bg-fill ~/Downloads/emad.jpg
sh ~/.config/polybar/launch.sh &

xset +fp /usr/share/fonts/local &
xset fp rehash &
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

sxhkd &
exec bspwm
