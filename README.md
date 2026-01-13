# Spring Boot Microservice

Это приложение представляет собой микросервис на Spring Boot, контейнеризированный с помощью Docker.

## Стек технологий

- Java 17 (Eclipse Temurin)
- Spring Boot 4.0.1
- Gradle
- Docker
- Docker Compose

## Запуск приложения

### Локальный запуск

Для запуска приложения на вашей локальной машине, убедитесь, что у вас установлена Java 17+ и выполните:

На Linux/Mac:
```bash
./gradlew bootRun
```

На Windows:
```cmd
.\gradlew.bat bootRun
```

Приложение будет доступно по адресу http://localhost:8080

### Запуск через Docker

Перед запуском убедитесь, что у вас установлены:
- Java 17+ (для локальной сборки)
- Docker и Docker Compose

Сначала соберите проект локально:

На Linux/Mac:
```bash
./gradlew build
```

На Windows:
```cmd
.\gradlew.bat build
```

Затем соберите и запустите Docker контейнер:
```bash
docker-compose up --build
```

После этого приложение будет доступно по адресу http://localhost:8080

## API endpoints

- `/` - главная страница
- `/health` - проверка состояния сервиса
- `/api/hello` - приветствие от микросервиса

## Сборка проекта

```bash
./gradlew build
```

Собранный JAR файл будет находиться в директории `build/libs/`

## Деплой на сервер

Для деплоя на сервер выполните следующие шаги:

1. Скопируйте исходный код на сервер
2. Установите Docker и Docker Compose
3. Выполните команду:
   ```bash
   docker-compose up --build -d
   ```
4. Приложение будет доступно на порту 8080

## Деплой в облако

Для деплоя в облако (например, AWS, GCP, Azure) вы можете:

1. Собрать Docker образ локально:
   ```bash
   ./gradlew build
   docker build -t your-registry/ssp-kr-microservice:latest .
   ```
2. Загрузить образ в облачный реестр:
   ```bash
   docker push your-registry/ssp-kr-microservice:latest
   ```
3. Запустить контейнер в облачной среде с использованием Kubernetes, Docker Swarm или других оркестраторов

## Запуск в Windows (PowerShell)

Если вы используете Windows и PowerShell, команда для запуска будет та же:

```powershell
docker-compose up --build -d
```

Убедитесь, что у вас установлены:
- Docker Desktop для Windows
- WSL 2 (рекомендуется)

Для запуска в PowerShell:
1. Откройте PowerShell от имени администратора
2. Перейдите в директорию с проектом (где находится файл docker-compose.yml)
3. Выполните команду: `docker-compose up --build -d`

Для просмотра логов: `docker-compose logs -f`

Для остановки сервиса: `docker-compose down`

## Автоматический деплой

Для автоматического деплоя доступны скрипты:

- `deploy.sh` для Linux/Mac
- `deploy.bat` для Windows

Для запуска в Windows просто дважды щелкните по файлу `deploy.bat` или выполните его из командной строки.