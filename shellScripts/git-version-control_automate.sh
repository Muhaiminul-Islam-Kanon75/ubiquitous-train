#!/bin/bash

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
SCRIPT_LOG="$SCRIPT_DIR/github_upload.log"

git_upload_dir="/home/kanon47/Documents/VersionControl/kubernetes/"

dir_update_stat=$(stat $git_upload_dir | awk -F" " 'NR==6 {print $2}' | date --date - '+%F')

# stat kubernetes/ | awk -F" " 'NR==6 {print $2" "$3}' | date -d - '+%s'

if [[ "$dir_update_stat" != $(date +%F) ]]; then
    echo -e "$(date +%F) Directory $git_upload_dir was not updated today" >> "$SCRIPT_LOG"
    exit 1
fi  

commit_msg="$(date +'%F %r') docs(k8s-manifest): update manifest files"

manifest_path='/nfs_client/k8s-Manifest/'
git_data_path='/home/kanon47/Documents/VersionControl/kubernetes/manifest-files/'

# copy the files from nfs_client to the local git directory
cp $manifest_path/* $git_data_path --update=all 

if ! cd /home/kanon47/Documents/VersionControl/ 
then 
    echo -e "$(date +%F) Directory not found" >> "$SCRIPT_LOG"
    exit 1 
fi 

{
git status
git add . 
git commit -m "$commit_msg"
} >> "$SCRIPT_LOG" 2>&1

# print the git branch output 
branch_name=$(git rev-parse --abbrev-ref HEAD)

git push origin -u "$branch_name" >> "$SCRIPT_LOG" 2>&1

if [ $? -ne 0 ]; then 
    echo -e "$(date +%F) Git push failed" >> "$SCRIPT_LOG"
    exit 1 
else
    echo -e "$(date +%F) Git push succeeded" >> "$SCRIPT_LOG"
    exit 0
fi


# sh /home/kanon47/Documents/scripts/git-upload-script.sh