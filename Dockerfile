FROM alpine:latest
MAINTAINER Kenny  houxg@putao.com
RUN apk --update add nginx php-fpm php-json php-curl php-gd php-pdo php-memcache supervisor php-mysql php-pdo_mysql
RUN apk add php-zip php-iconv
RUN apk --update add php-redis --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
COPY index.php /usr/share/nginx/html
COPY start.sh /
COPY supervisord.conf /etc/
#COPY nginx.conf /etc/nginx/
COPY php-fpm.conf /etc/php/
#EXPOSE 80
CMD ["/bin/sh","/start.sh"]
#CMD ["nginx", "-g", "daemon off;"]
