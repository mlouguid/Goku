FROM nginx:latest

WORKDIR /usr/share/nginx/html

COPY ./fastcgi_params /etc/nginx/fastcgi_params

COPY ./app.conf /etc/nginx/app.conf

EXPOSE ${SERVER_PORT}


CMD ["nginx", "-g", "daemon off;"]
