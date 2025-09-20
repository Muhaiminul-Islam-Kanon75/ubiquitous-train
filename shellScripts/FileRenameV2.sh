#!/bin/bash


SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
SCRIPT_LOG=$SCRIPT_DIR/FileRename2.log

S_time=$(date +%s) 

for path in /home/mikanon37/Documents/linux/world/day_cpy/*; do
    echo "$path"
    if [ ! -d "$path" ]; then
    echo "Directory does not exist"
    exit 1
    fi

    find "$path" -name "*.txt" -exec mv "{}" "{}_$(date +%Y%m%d)" \;
done

E_time=$(date +%s)

Time_taken=$((E_time-S_time))

echo "Time taken to rename files is $Time_taken seconds"  >> "$SCRIPT_LOG"