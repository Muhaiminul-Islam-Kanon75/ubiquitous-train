#!/bin/bash

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
SCRIPT_LOG=$SCRIPT_DIR/ServiceMonitor.log

mailbody=$SCRIPT_DIR/mailbody.txt
mailsub="Service Restarted in $(hostname -i | cut -d" " -f2)"
mailto='mikanon37@gmail.com'
SSHUSER=mikanon37
SSHSERVER='192.168.0.116'

echo -e "Service Monitor started at $(date)" > "$SCRIPT_LOG"

echo -e "Dear Concern, \n\nFollowing Services has been restarted\n" > "$mailbody"

for service in $(cat "$SCRIPT_DIR"/MonitorList.txt); do
    
    if systemctl is-active --quiet "$service"; then
        echo -e "$(date +"%F %H:%M:%S")\t $service is running" >> "$SCRIPT_LOG"
    else
        systemctl restart "$service"
        echo -e "$(date +"%F %H:%M:%S")\t $service is not running" >> "$SCRIPT_LOG"
        echo -e "$(date +"%F %H:%M:%S")\t $service restarted" | tee -a "$SCRIPT_LOG" >> "$mailbody"
        #echo -e "$(date +"%F %H:%M:%S")\t $service restarted"  >> "$mailbody"
        cat "$mailbody" | mailx -s "$mailsub" -r "mailalert404@gmail.com" "$mailto"  
        
    fi
done

sshpass -p '4747378ka' ssh -p 22 $SSHUSER@$SSHSERVER

if [ $? -ne 0 ]; then
    echo -e "$(date +"%F %H:%M:%S")\t Failed to login to the remote server" >> "$SCRIPT_LOG"
    exit 1
fi

for service in sshd nginx haproxy; do
    if systemctl is-active --quiet $service; then
        echo -e "$(date +"%F %H:%M:%S")\t $service is running" >> "$SCRIPT_LOG"
    else
        systemctl restart "$service"
        echo -e "$(date +"%F %H:%M:%S")\t $service is not running"  >> "$SCRIPT_LOG"
        echo -e "$(date +"%F %H:%M:%S")\t $service restarted"  >> "$SCRIPT_LOG"
    fi
done

echo -e "Service Monitor ended at $(date)" >> "$SCRIPT_LOG"

# To run the script, use the following command:
#/home/mikanon37/Projects/ServiceMonitor/ServiceMonitor.sh
