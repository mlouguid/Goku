# 🐳 Docker Environment Setup

## 📦 Docker Hub Images

You can pull the prebuilt images from Docker Hub:

```sh
docker pull marouanetesting/php:v1.1
docker pull marouanetesting/nginx:v1.1
docker pull marouanetesting/mysql:v1.1
docker pull marouanetesting/redis:v1.1

```

## 🚀 Deploy Containers Using Docker Compose

```sh
docker-compose up -d
```

## 🧪 Docker CLI: Logs, Shell Access, and Network

```sh
docker logs container-x

docker network inspect local_network

docker exec -it container-x bash

```

## 📤 Tag and Push Containers to Docker Hub
```
> docker login

// update marouanetesting with your user docker-hub

docker tag  container-x marouanetesting/container-x:vx.x

docker push container-x:vx.x
```

