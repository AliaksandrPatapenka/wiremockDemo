# wiremockDemo


Структура проекта:

```
├── wiremock-jre8-standalone-2.35.0
│   ├── custom-transformer.jar
│   ├── __files
│   │   └── users.json
│   ├── mappings
│   │   └── checkAuthorization.json
│   ├── run.sh
│   ├── wiremock-jre8-standalone-2.35.0.jar
└── wiremock-standalone-3.4.2
    ├── __files
    │   └── checkXML.xml
    ├── mappings
    │   ├── checkJson.json
    │   ├── checkURL.json
    │   ├── checkXML.json
    │   └── firstMock.json
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

  # Endpoints

## Версия 2.35.0

### 1. checkAuthorization

Тест обрабатывает данные из запроса (email и пароль).

**Условия и ответы:**

-   **При успехе (Status 200):**
    ```json
    {
        "status": "success",
        "userId": "id_пользователя",
        "sessionCookie": "sessionCookie.value"
    }
    ```

-   **Если пользователь не найден (Status 404):**
    ```json
    {
        "status": "error",
        "message": "Not Found"
    }
    ```

-   **Если неверный пароль (Status 401):**
    ```json
    {
        "status": "error",
        "message": "Unauthorized"
    }
    ```

**Тестовые учетные записи:**
-   `test1@test.ru` / `password1`
-   `test2@test.ru` / `password2`
-   `test3@test.ru` / `password3`

Список пользователей и паролей находится в файле `users.json`. Список масштабируемый.

**Пример запроса:**
```bash
curl -X POST http://localhost:8080/checkAuthorization \
  -H "Content-Type: application/json" \
  -d '{
       "email": "test1@test.ru",
       "password": "password1"
      }'
```

## Версия 3.4.2

### 1. firstMock

С помощью **urlPattern** обрабатывает параметры, переданные через URL:
- Фамилия
- Числовой id
- Имя
- id в формате GUID

**Пример запроса:**
```bash
curl -X GET "http://localhost:8080/service/firstMock/Test/0001/Aleks/query?p1=b0d4ce5d-2757-4699-948c-cfa72ba94f86" \
     -H "Content-Type: text/html"
```

### 2. checkURL

С помощью **queryParameters** обрабатывает параметры `p1` и `p2`, переданные в URL. Ответ возвращает значения переданных параметров.

**Формат ответа:**
```
p1 = [значение p1], p2 = [значение p2]
```

**Пример запроса:**
```bash
curl -X GET "http://localhost:8080/checkURL?p1=param1&p2=param2" \
     -H "Content-Type: text/html"
```

### 3. checkXML

С помощью **bodyPatterns**  обрабатывает данные в XML. При совпадении возвращает XML из файла `checkXML.xml`.

**Пример запроса:**
```bash
curl -X POST http://localhost:8080/checkXML \
     -H "Content-Type: text/xml; charset=utf-8"
```

### 4. checkJson

С помощью **bodyPatterns** обрабатывает JSON из тела запроса. При совпадении с шаблоном возвращает данные из запроса + добавляется третий параметр в виде случайного числа.

**Пример ответа:**
```json
{
    "userId": "001",
    "userName": "myName",
    "randomInteger": "58896360"
}
```

**Пример запроса:**
```bash
curl -X POST http://localhost:8080/checkJson \
  -H "Content-Type: application/json" \
  -d '{
       "userId": "001",
       "userName": "myName"
      }'
```
