@echo off
echo Начинаем деплой Spring Boot микросервиса...

REM Проверяем наличие Docker
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: Docker не установлен.
    pause
    exit /b 1
)

REM Проверяем наличие Docker Compose
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: Docker Compose не установлен.
    pause
    exit /b 1
)

REM Проверяем наличие Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: Java не установлена. Требуется Java 17+ для сборки проекта.
    pause
    exit /b 1
)

echo Собираем проект...
.\gradlew.bat build

if %errorlevel% neq 0 (
    echo Ошибка при сборке проекта. Проверьте, установлена ли Java 17+ и правильно ли настроена переменная окружения JAVA_HOME.
    pause
    exit /b 1
)

echo Сборка проекта завершена. Создаем Docker образ...

REM Собираем Docker образ
docker-compose build

if %errorlevel% neq 0 (
    echo Ошибка при создании Docker образа
    pause
    exit /b 1
)

echo Docker образ создан. Запускаем контейнер...

REM Запускаем контейнер
docker-compose up -d

if %errorlevel% neq 0 (
    echo Ошибка при запуске контейнера
    pause
    exit /b 1
)

echo Микросервис успешно задеплоен!
echo Приложение доступно по адресу: http://localhost:8080

REM Проверяем статус контейнера
docker-compose ps

pause