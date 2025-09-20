#!/bin/bash

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
SCRIPT_LOG=$SCRIPT_DIR/FileRename.log

S_time=$(date +%s) >> "$SCRIPT_LOG"

read -r -p "Enter the directory path(absolute path): " dir_path

# -r flag is used to read the input as it is without interpreting the backslashes
# -p flag is used to prompt the user for input

echo -e "Directory name input done. Processing the directory\n" >> "$SCRIPT_LOG"

if [ ! -d "$dir_path" ]; then
    echo "Directory does not exist"
    exit 1
fi

echo -e "$dir_path\n" && echo -e "Files in the directory are: $(ls -lrt "$dir_path")"

find "$dir_path" -name "*.txt" -exec mv "{}" "{}_$(date +%Y%m%d)" \;

E_time=$(date +%s)

Time_taken=$((E_time-S_time)) >> "$SCRIPT_LOG"

echo "Time taken to rename files is $Time_taken seconds"

#cp /media/sf_E_DRIVE/linux/scripting/FileRename.sh /home/mikanon37/Projects/