#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Unesi 2 direktorija za sinkronizaciju!"
    exit 1
fi

dir1="$1"
dir2="$2"

for file1 in $(find "$1" -type f); do
    file1basename=$(basename "$file1")
    file2="${dir2}/${file1basename}"

    if ! [ -e "$file2" ] || [ "$file1" -nt "$file2" ]; then
        echo "$file1 --> $dir2"
    fi
done

for file2 in $(find "$2" -type f); do
    file2basename=$(basename "$file2")
    file1="${dir1}/${file2basename}"
    
    if ! [-e "$file1" ] || [ "$file2" -nt "$file1" ]; then
        echo "$file2 --> $dir1"
    fi
done