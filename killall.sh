#!/bin/sh
# Doppelpunkt nach einem Buchstaben bedeutet: Diese Option braucht ein Argument
SIG="HUP"
while getopts "hs:" option; do
    case $option in
        h) # Option -h
            echo "Benutzung: $0 [-h] [-s signal] process"
            exit 0
            ;;
        s) # Option -f mit Wert (gespeichert in $OPTARG)
            SIG="$OPTARG"
            echo "SIG gesetzt auf: $SIG"
            shift
            shift
            ;;
        ?) # Ungültige Option
            echo "Ungültige Option. Nutzen Sie -h für Hilfe."
            exit 1
            ;;
    esac
done
echo "\$1=$1"
CMD=$1
echo "CMD=$CMD"
PIDS=$(ps | grep -iE -- "$CMD" | gawk '{print $1}')
echo -n "PIDS of $CMD"
echo "$PIDS" | fmt
for PID in $PIDS ; do
	kill -s $SIG $PID
done
