#!/bin/sh
#set -vx
HISTFILE=~/.bash_history
set -o history
CMD=$1
H_CMD=$(history | cut -b8- | grep -i -- $CMD | grep -Ev '^(xterm|find)' | grep '/' | grep -v 'cd ' | grep -v '\./' \
 | sed -Ee 's/nohup //g' -e 's/&//g' | tac | uniq2 | tac | tail -n1)
echo "H_CMD $H_CMD"
DIR=$(dirname $H_CMD)
cd $DIR
nohup $H_CMD &
#set +vx
