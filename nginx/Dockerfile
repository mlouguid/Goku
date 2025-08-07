FROM nginx:latest

WORKDIR /usr/share/nginx/html

COPY ./fastcgi_params /etc/nginx/fastcgi_params

COPY ./beta.conf /etc/nginx/conf.d/beta.conf

EXPOSE ${SERVER_PORT}


CMD ["nginx", "-g", "daemon off;"]
