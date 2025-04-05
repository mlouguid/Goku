<div align="center">

# containerize-php-app

</div>

<img src="./imgs/shema.png" alt="php mysql mysql redis nginx docker k8s" />

- [x] simple project containerize php-nginx-mysql
- [x] simple php-code
- [x] redis-database
- [x] deploy k8s

project folder structure

```sh
├── docker-compose.yaml
├── services/
│   ├── database/
│   │   ├── mysql/
│   │   │   ├── Dockerfile
│   │   │   ├── .env
│   │   ├── redis/
│   │   │   ├── Dockerfile
│   │   │   ├── .env
│   └── web/
│       ├── nginx/
│       │   ├── Dockerfile
│       │   ├── app.conf
│       │   ├── fastcgi_params
│       │   └── .env
│       └── php/
│           ├── public/
│           │   └── index.php
│           ├── src/
│           ├── composer.json
│           ├── Dockerfile
│           ├── .env
├── infra/
│   ├── k8s/
│       ├── deployments/
│       └── services/
```

## docker cli

```sh
docker-compose up -d
```
