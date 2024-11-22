#!/bin/bash

# Создаем базовую директорию если её нет
mkdir -p ~/reminder_bot

# Переходим в директорию проекта
cd ~/reminder_bot

# Если директория пустая или .git не существует, клонируем репозиторий
if [ ! -d ".git" ]; then
    # Очищаем директорию
    rm -rf *
    # Клонируем репозиторий в текущую директорию
    git clone https://github.com/bagahizriev/reminder-bot.git .
fi

# Получаем последние изменения
git fetch origin
git reset --hard origin/main

# Создаем необходимые директории
mkdir -p data
mkdir -p temp
mkdir -p ~/backups

# Устанавливаем права
chmod 777 data
chmod 777 temp

# Проверяем наличие .env файла
if [ ! -f ".env" ]; then
    echo "Creating .env file..."
    echo "TELEGRAM_TOKEN=${TELEGRAM_TOKEN}" > .env
    echo "HUGGING_FACE_TOKEN=${HUGGING_FACE_TOKEN}" >> .env
    echo "DATABASE_PATH=/app/data/reminders.db" >> .env
fi

# Проверяем наличие docker-compose.yml
if [ ! -f "docker-compose.yml" ]; then
    echo "Error: docker-compose.yml not found!"
    exit 1
fi

# Перезапускаем контейнер
docker-compose down
docker-compose up -d --build