#!/bin/bash
timestamp=$(date +%Y%m%d_%H%M%S)
cp ~/reminder_bot/reminders.db ~/backups/reminders_${timestamp}.db
find ~/backups -name "reminders_*.db" -mtime +7 -delete 