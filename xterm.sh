#!/bin/sh
(cd ; nohup xterm -class UXTerm -title uxterm -u8 $* 2>&1 > /dev/null &) 2>&1 > /dev/null

