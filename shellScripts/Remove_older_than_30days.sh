#!/bin/bash

echo -e "Script Running... $(date)" >> /tmp/directory.log

S_time=$(date +%s)

for i in directoy.txt
do
    ls -lrt "$i" > /tmp/directory.log
    
    find "$i" -type f -mtime +30 -exec rm -f {} \;
    if [ $? -eq 0 ]; then
        echo -e "$(date +%T) \t $i\t\t files Deleted successfully" >> /tmp/success.log
    else
        echo -e "$(date +%T) \t $i\t\t File Deletion failed" >> /tmp/failed.log
    fi
done

E_time=$(date +%s)
Time_taken=$((E_time-S_time))

echo "Time taken to delete files is $Time_taken seconds"

# chmod +x Remove_older_than_30days.sh
# ./Remove_older_than_30days.sh
