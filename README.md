# WireMock Demo Project

Структура проекта:

```
├── wiremock-jre8-standalone-2.35.0
│   ├── custom-transformer.jar
│   ├── __files
│   ├── mappings
│   ├── run.sh
│   ├── wiremock-jre8-standalone-2.35.0.jar
│   └── wiremock.log
└── wiremock-standalone-3.4.2
    ├── __files
    ├── mappings
    ├── run.sh
    ├── wiremock-body-transformer-1.1.6.jar
    ├── wiremock.log
    └── wiremock-standalone-3.4.2.jar
```

## Описание версий

### wiremock-jre8-standalone-2.35.0
- **custom-transformer.jar** - кастомный трансформер для WireMock
- **__files/** - директория с файлами для моков
- **mappings/** - директория с маппингами endpoints
- **run.sh** - скрипт для запуска WireMock
- **wiremock-jre8-standalone-2.35.0.jar** - основной JAR файл
- **wiremock.log** - файл логов

### wiremock-standalone-3.4.2  
- **wiremock-body-transformer-1.1.6.jar** - трансформер тел запросов
- **__files/** - директория с файлами для моков
- **mappings/** - директория с маппингами endpoints
- **run.sh** - скрипт для запуска WireMock
- **wiremock-standalone-3.4.2.jar** - основной JAR файл
- **wiremock.log** - файл логов

## Быстрый старт

```bash
# Запуск версии 2.35.0
cd wiremock-jre8-standalone-2.35.0
./run.sh

# Запуск версии 3.4.2  
cd wiremock-standalone-3.4.2
./run.sh
```
