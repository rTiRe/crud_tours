### create container
```
docker run -d \
--name tours \
-e POSTGRES_USER=tour_admin \
-e POSTGRES_PASSWORD=1234567890 \
-e POSTGRES_DB=tours_db \
-p 38746:5432 \
postgres:15.5
```

### docker build
```
docker build . -t crud:0.0.2
```

### migrations up
```
docker run --rm --add-host=host.docker.internal:host-gateway --network=host -v "$(pwd)/migrations:/db/migrations" ghcr.io/amacneil/dbmate:2.12 -u "postgres://tour_admin:1234567890@host.docker.internal:38746/tours_db?sslmode=disable" up
```

### flask run
```
docker run --add-host=host.docker.internal:host-gateway -e PG_HOST=host.docker.internal -e PG_PORT=38746 -e PG_DBNAME=tours_db -e PG_USER=tour_admin -e PG_PASSWORD=1234567890 -e FLASK_PORT=5001 crud:0.0.2
```
