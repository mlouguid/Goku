## K8S

Apply deployments config
```sh
kubectl apply -f k8s/deployments/postgres.yaml
kubectl apply -f k8s/deployments/redis.yaml
kubectl apply -f k8s/deployments/nginx.yaml
kubectl apply -f k8s/deployments/php.yaml
```

Apply services config
```sh
kubectl apply -f k8s/services/postgres_service.yaml
kubectl apply -f k8s/services/redis_service.yaml
kubectl apply -f k8s/services/nginx_service.yaml
kubectl apply -f k8s/services/php_service.yaml
```

Apply secrets config
```sh
kubectl apply -f k8s/secrets/postgres_secrets.yaml
```

Apply pvc config
```sh
kubectl apply -f k8s/pvc/postgres_pv.yaml
kubectl apply -f k8s/pvc/postgres_pvc.yaml
```

Apply all
```sh
kubectl apply -f k8s
```

deployment status

```sh
// get namespace
kubectk get goku 

// kubectl get all
kubectl get pods
kubectl get services
kubectl get pvc
kubectl get pv
kubectl get secrets
```
