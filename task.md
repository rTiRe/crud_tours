[Весь пример целиком](https://github.com/sirius-db-dev/db-docs/tree/crud_example)

1. Сделать `create`/`read`/`update`/`delete` `rest api` методы на `flask` для указанной темы и сущности
    - `read` метод должен так же возвращать связанные сущности в виде массива объектов [(пример)](https://github.com/sirius-db-dev/db-docs/blob/crud_example/app.py#L34)
    - в запросах к базе данных должна быть предусмотрена защита от SQL инъекций

2. Раскатка базы данных должна производиться с помощью [миграций](https://github.com/sirius-db-dev/db-docs/blob/crud_example/docker-compose.yml#L16)
    - [базу данных](https://github.com/sirius-db-dev/db-docs/blob/crud_example/.env#L3) и [схему](https://github.com/sirius-db-dev/db-docs/blob/crud_example/migrations/202402281911_InitializeData.sql#L5) использовать отличные от дефолтных
    - для id использовать [тип uuid](https://sirius-db-dev.github.io/db-docs/docs/postgresql/uuid)

3. Запуск должен производиться через `docker compose`
    - параметры запуска должны задаваться через `.env` файл [(пример)](https://github.com/sirius-db-dev/db-docs/blob/crud_example/.env)

## Тюрин

Турагенства и туры:

- тур может продаваться в нескольких турагенствах
- турагенство может продавать много туров
- турагенство - название, адрес, телефон, рейтинг
- тур - название, описание

Туры и города:

- тур может проходить по нескольким городам
- город - название, страна, координаты

`CRUD` для туров