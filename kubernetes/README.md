## K8S

Apply deployments conf
```sh
kubectl apply -f k8s/deployments/containerize-app-mysql.yaml
kubectl apply -f k8s/deployments/containerize-app-redis.yaml
kubectl apply -f k8s/deployments/containerize-app-nginx.yaml
kubectl apply -f k8s/deployments/containerize-app-php.yaml
```

Apply services conf
```sh
kubectl apply -f k8s/services/containerize-app-mysql_service.yaml
kubectl apply -f k8s/services/containerize-app-redis_service.yaml
kubectl apply -f k8s/services/containerize-app-nginx_service.yaml
kubectl apply -f k8s/services/containerize-app-php_service.yaml
```

Apply secrets conf
```sh
kubectl apply -f k8s/secrets/containerize-app-mysql_secrets.yaml
```

Apply pvc conf
```sh
kubectl apply -f k8s/pvc/containerize-app-mysql_pv.yaml
kubectl apply -f k8s/pvc/containerize-app-mysql_pvc.yaml
```

Apply all
```sh
kubectl apply -f k8s
```

deployment status
```sh
// kubectl get all
kubectl get pods
kubectl get services
kubectl get pvc
kubectl get pv
kubectl get secrets
```
