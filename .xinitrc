#!/bin/sh
# ~/.xinitrc
xrdb -merge ~/.Xresources
cd ~/xterm/ 
nohup xterm -geometry 116x30 -class UXTerm -title uxterm -u8 2>&1 > /dev/null &
nohup xterm -geometry 116x30 -class UXTerm -title uxterm -u8 2>&1 > /dev/null &
exec /c/cygwin64/bin/xwin-xdg-menu
