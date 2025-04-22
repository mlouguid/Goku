<div align="center">

# containerize-php-app

</div>

<img src="./imgs/shema.png" alt="php mysql mysql redis nginx docker k8s" />

## Project Requirements
	•	Containerized application using PHP, Nginx, MySQL, and Redis
	•	Simple PHP application code for demonstration
	•	CI/CD setup using GitHub Actions
	•	Deployment to Kubernetes (K8s)

## Infra Project

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

## K8s cli
```sh
kubectl apply -f infra/k8s
```

