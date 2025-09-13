#!/bin/bash

# https://api.telegram.org/bot8412711666:AAHO8F1mTQt_yH185APvHYrnN5t0ff5IiQE/getUpdates

BOT_TOKEN="8412711666:AAHO8F1mTQt_yH185APvHYrnN5t0ff5IiQE"
CHAT_ID="2032649319"
MESSAGE="$1"

curl -s -X POST https://api.telegram.org/bot$BOT_TOKEN/sendMessage \
  -d chat_id=$CHAT_ID \
  -d text="$MESSAGE"

