#!/bin/sh

# Find similar files 
function find_similar_files {
    echo >&2 "Finding similar files for: $1"
    extension="${1##*.}"
    echo >&2 "File extension: $extension"
    part="${1%.*}"
    echo >&2 "File name without extension: $part"
    beginning=$(echo "$part" | sed -Ee 's/ \([0-9]\)//g' -e 's/ - (Kopie|copy)//gi' ) 
    echo >&2 "File name beginning: $beginning"
    retval=""
    #echo >&2 "retval=$retval"
    ### The retval variable is not accessible outside the subshell created by the while loop.
    ### This will result in an empty output. Refactor the code to avoid using a subshell.
    #find . -iname "$beginning*$extension" -type f | while read -r file; do
        # ...
    #done
    while IFS= read -r file; do
    #     echo >&2 "Found similar file: $file"
         retval+="$file"
         retval+=$'\n'
    done < <(find . -iname "$beginning*$extension" -type f -maxdepth 1)
    echo "$retval"
    return 0
}

function process_file {
    echo "===> Processing file: $1  <==="
    # Check if the file is a regular file
    if ! [  -f "$1" ]; then
        echo "File $1 is not a regular file."
        return 1
    fi
    #find_similar_files "$1"
    similar_files=$(find_similar_files "$1")
    if [ $? -ne 0 ]; then
        echo "Error finding similar files for $1"
        return 1
    fi
    echo "Similar files found for $1:"
    #echo "$similar_files" 
    # list long()) all similar files with xargs
    #echo "$similar_files" | xargs -I {} ls -l {}
    # loop over all similar files and print them with a number
    i=0
    while IFS= read -r file; do
        echo -ne "$i\t"
        ls -l "$file"
        i=$((i+1))
    done <<< "$similar_files"
    if [ $i -eq 1 ]; then
        echo "No further similar files found for $1"
        echo ""
        return 0
    fi
    echo "numbers to delete"
    read -ep "Enter the numbers of the files you want to delete (separated by spaces): " -a numbers
    echo "You entered: ${numbers[@]}"
    # loop over all numbers and delete the corresponding files
    for number in "${numbers[@]}"; do
        # check if the number is valid
        if [ "$number" -ge 0 ] && [ "$number" -lt "$i" ]; then
            file=$(echo "$similar_files" | sed -n "$((number + 1))p")
            echo "Deleting file: $file"
            rm -vi "$file"
        else
            echo "Invalid number: $number"
        fi
    done
    echo ""
}  

# Check if the user provided a directory or filenames
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory_or_file> [<directory_or_file> ...]"
    exit 1
fi
# Loop through all provided arguments 
for arg in "$@"; do
    # Check if the argument is a directory
    if [ -d "$arg" ]; then
        echo "Processing directory: $arg"
        # Find all files in the directory and process each one
        find "$arg" -type f -maxdepth 1 | while read -r file; do
            process_file "$file"
        done
    elif [ -f "$arg" ]; then
        process_file "$arg"
    else
        echo "Error: $arg is not a valid file or directory (anymore)."
    fi
done
