# WireMock Demo Project

Структура проекта:

```
├── wiremock-jre8-standalone-2.35.0
│   ├── custom-transformer.jar
│   ├── __files
│   ├── mappings
│   ├── run.sh
│   ├── wiremock-jre8-standalone-2.35.0.jar
└── wiremock-standalone-3.4.2
    ├── __files
    ├── mappings
    ├── run.sh
    ├── wiremock-body-transformer-1.1.6.jar
    └── wiremock-standalone-3.4.2.jar
```

## Описание версий

### wiremock-jre8-standalone-2.35.0
- **custom-transformer.jar** - кастомный трансформер для WireMock
- **__files/** - директория с файлами для моков
- **mappings/** - директория с маппингами endpoints
- **run.sh** - скрипт для запуска WireMock
- **wiremock-jre8-standalone-2.35.0.jar** - основной JAR файл
- **wiremock.log** - файл логов (создается при запуске)

### wiremock-standalone-3.4.2  
- **wiremock-body-transformer-1.1.6.jar** - трансформер тел запросов
- **__files/** - директория с файлами для моков
- **mappings/** - директория с маппингами endpoints
- **run.sh** - скрипт для запуска WireMock
- **wiremock-standalone-3.4.2.jar** - основной JAR файл
- **wiremock.log** - файл логов (создается при запуске)

## Команды запуска

### Запуск версии 3.4.2
```bash
cd wiremock-standalone-3.4.2
java -cp "wiremock-body-transformer-1.1.6.jar:wiremock-standalone-3.4.2.jar" \
wiremock.Run \
--port 8080 \
--verbose > wiremock.log \
--extensions com.opentable.extension.BodyTransformer
```

### Запуск версии 2.35.0
```bash
cd wiremock-jre8-standalone-2.35.0
java -cp "wiremock-jre8-standalone-2.35.0.jar:custom-transformer.jar" \
    com.github.tomakehurst.wiremock.standalone.WireMockServerRunner \
    --port 8080 \
    --verbose > wiremock.log \
    --extensions com.example.transformer.CustomAuthTransformer
```

## Быстрый старт

```bash
# Запуск версии 3.4.2
cd wiremock-standalone-3.4.2
./run.sh
```

```bash
# Запуск версии 2.35.0
cd wiremock-jre8-standalone-2.35.0
./run.sh
```

## Порт и настройки
- **Порт по умолчанию**: 8080
- **Логирование**: verbose режим
- **Логи сохраняются в**: wiremock.log
- **Расширения**: включены кастомные трансформеры
