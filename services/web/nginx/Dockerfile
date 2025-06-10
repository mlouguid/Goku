FROM nginx:1.28.0-alpine3.21-slim

WORKDIR /usr/share/nginx/html

COPY ./fastcgi_params /etc/nginx/fastcgi_params

COPY ./app.conf /etc/nginx/conf.d/app.conf

EXPOSE ${SERVER_PORT}


CMD ["nginx", "-g", "daemon off;"]
