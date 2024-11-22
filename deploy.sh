#!/bin/bash

# Переходим в директорию проекта
cd ~/reminder_bot

# Если директория не существует, клонируем репозиторий
if [ ! -d ".git" ]; then
    cd ..
    rm -rf reminder_bot
    git clone https://github.com/your-username/reminder-bot.git
    cd reminder_bot
fi

# Получаем последние изменения
git fetch origin
git reset --hard origin/main

# Проверяем наличие .env файла
if [ ! -f ".env" ]; then
    echo "Creating .env file..."
    echo "TELEGRAM_TOKEN=${TELEGRAM_TOKEN}" > .env
    echo "HUGGING_FACE_TOKEN=${HUGGING_FACE_TOKEN}" >> .env
fi

# Создаем директорию для бэкапов если её нет
mkdir -p ~/backups

# Перезапускаем контейнер
docker-compose up -d --build 