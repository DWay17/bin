#!/bin/env sh
# get command of PPID and dont use -o for compatibelity
# use awk to skip the header line and print the last column
ps -p $PPID | awk 'NR>1 {print $NF}'
