#!/bin/sh
#nohup $@ 2>&1 >/dev/null &
nohup $* 2>&1 >/dev/null &
