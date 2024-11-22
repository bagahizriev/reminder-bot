#!/bin/bash
cd ~/reminder_bot
git pull origin main
docker-compose up -d --build 