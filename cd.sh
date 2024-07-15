#!/bin/sh
PARAMS=$@
echo $PARAMS
A0=$(xargs -0)
echo $A0
UPATH=$(echo $PARAMS | xargs cygpath -u )
echo $UPATH

