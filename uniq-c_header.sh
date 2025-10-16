#!/bin/sh
(read HEAD ; echo "      # $HEAD"; uniq -c)
