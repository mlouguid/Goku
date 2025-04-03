docker hub images;

## docker-compose cli

```sh
docker-compose down --rmi all -v
docker-compose up -d
```

## docker cli

```sh
docker logs containerize_app_nginx
docker logs containerize_app_php

# subnet mask 255.255.255.0
docker network create --subnet=10.10.0.0/24 --gateway=10.10.0.1 app_network
docker network inspect app_network

docker exec -it containerize_app_nginx bash
docker exec -it containerize_app_php bash

docker exec -it containerize_app_redis bash
docker exec -it containerize_app_mysql bash
```