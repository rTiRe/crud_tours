## Запуск

### 1. Клонирование
```
git clone https://github.com/rTiRe/crud_tours.git
cd crud_tours
```

### 2. Создание файла окружения
В основной папке присутствует файл-пример `.env.example`.
Для начала работы его достаточно переименовать в `.env`, но, конечно, желательно поменять значения.
* `POSTGRES_HOST` - адрес postgres.
* `POSTGRES_PORT` - порт, на котором запущена БД
* `POSTGRES_DB` - имя используемой базы данных
* `POSTGRES_USER` - имя пользователя postgres
* `POSTGRES_PASSWORD` - пароль postgres
* `FLASK_PORT` - порт, на котором запущен Flask

> [!NOTE]
> `POSTGRES_HOST=host.docker.internal` если запуск будет производиться через `docker compose up`
> Если запуск будет производиться напрямую, то необходимо указать точный адрес базы данных.

### docker build
```
docker build . -t crud:0.0.6
```

### migrations up
```
docker run --rm --add-host=host.docker.internal:host-gateway --network=host -v "$(pwd)/migrations:/db/migrations" ghcr.io/amacneil/dbmate:2.12 -u "postgres://tour_admin:1234567890@host.docker.internal:38746/tours_db?sslmode=disable" up
```

### flask run
```
docker run --add-host=host.docker.internal:host-gateway -e PG_HOST=host.docker.internal -e PG_PORT=38746 -e PG_DBNAME=tours_db -e PG_USER=tour_admin -e PG_PASSWORD=1234567890 -e FLASK_PORT=5001 crud:0.0.6
```
