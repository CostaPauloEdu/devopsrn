FROM mysql:5.7

ENV MYSQL_PASSWORD=infrA@devops!

ENV MYSQL_ROOT_PASSWORD=infrA@devops!

ENV MYSQL_USER=devops

ENV MYSQL_DATABASE=App

ADD conf/my.cnf /etc/mysql/my.cnf

###

FROM php:7.4-fpm

RUN apt-get update && docker-php-ext-install pdo pdo_mysql

###

FROM nginx:latest 

WORKDIR /var/www/application

COPY ./app /var/www/application

COPY ./conf/vhost.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 -R /var/www/application

EXPOSE 80

ENTRYPOINT [ "nginx" ]

CMD [ "-g", "daemon off;" ]