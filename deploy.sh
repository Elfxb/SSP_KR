#!/bin/bash

# Скрипт для деплоя Spring Boot микросервиса

echo "Начинаем деплой Spring Boot микросервиса..."

# Проверяем наличие Docker
if ! [ -x "$(command -v docker)" ]; then
  echo "Ошибка: Docker не установлен." >&2
  exit 1
fi

# Проверяем наличие Docker Compose
if ! [ -x "$(command -v docker-compose)" ]; then
  echo "Ошибка: Docker Compose не установлен." >&2
  exit 1
fi

# Проверяем наличие Java
if ! [ -x "$(command -v java)" ]; then
  echo "Ошибка: Java не установлена. Требуется Java 17+ для сборки проекта." >&2
  exit 1
fi

echo "Собираем проект..."
./gradlew build

if [ $? -ne 0 ]; then
    echo "Ошибка при сборке проекта. Проверьте, установлена ли Java 17+ и правильно ли настроена переменная окружения JAVA_HOME."
    exit 1
fi

echo "Сборка проекта завершена. Создаем Docker образ..."

# Собираем Docker образ
docker-compose build

if [ $? -ne 0 ]; then
    echo "Ошибка при создании Docker образа"
    exit 1
fi

echo "Docker образ создан. Запускаем контейнер..."

# Запускаем контейнер
docker-compose up -d

if [ $? -ne 0 ]; then
    echo "Ошибка при запуске контейнера"
    exit 1
fi

echo "Микросервис успешно задеплоен!"
echo "Приложение доступно по адресу: http://localhost:8080"

# Проверяем статус контейнера
docker-compose ps