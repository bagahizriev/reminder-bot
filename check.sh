#!/bin/bash
if ! docker ps | grep -q reminder_bot_bot; then
    cd ~/reminder_bot
    ./deploy.sh
    echo "Bot restarted at $(date)" >> restart.log
fi 