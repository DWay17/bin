#!/bin/env sh
# /cygdrive/c/Users/trichter/bin/remove_newer_dups.sh
# use find to get files with same name in different subfolders
# check for same content
# keep the oldest one and remove newer file

OIFS="$IFS"
IFS=$'\n'

for f in $(find . -type f -name '*.*' | sort | gawk '!seen[$0]++' ); do
    echo "check for file $f"
    # if filename end with ~ skip
    if [[ "$f" == *~ ]]; then
        echo "skipping file $f"
        continue
    fi
    for g in $(find . -type f -name "$(basename "$f")" | sort); do
        echo "found for file $f also file $g"
        if [ "$f" != "$g" ]; then
            if cmp -s "$f" "$g"; then
                if [ "$f" -nt "$g" ]; then
                    echo "Removing newer duplicate: $f"
                    #rm "$f"
                    mv -v --backup=numbered "$f" "$f~"
                else
                    echo "Removing newer duplicate: $g"
                    #   rm "$g"
                    mv -v --backup=numbered "$g" "$g~"
                fi
            else
                echo "file $f and file $g are not equal"
            fi
        else
            echo "filename is the same"
        fi
    done
    echo ""
done
IFS="$OIFS"
