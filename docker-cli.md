docker hub images;

## docker-compose cli

```sh
docker-compose up -d
```

## docker cli

```sh
docker logs containerize_app_nginx
docker logs containerize_app_php

docker network inspect app_network

docker exec -it containerize_app_nginx bash
docker exec -it containerize_app_php bash

docker exec -it containerize_app_redis bash
docker exec -it containerize_app_mysql bash
```
