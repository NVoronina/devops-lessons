FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y nginx php7.0 composer zip unzip php-zip php7.0-fpm php7.0-cgi nano net-tools

RUN rm -rf /var/www/html/*
ADD default /etc/nginx/sites-available/default
RUN service nginx restart

RUN sed -i "s/listen = \/run\/php\/php7.0-fpm.sock/listen = 127.0.0.1:9000/" /etc/php/7.0/fpm/pool.d/www.conf
RUN service php7.0-fpm start

RUN rm -rf /var/www/html/*
RUN git clone https://github.com/zendframework/ZendSkeletonApplication.git /var/www/html
RUN cd /var/www/html && composer install

EXPOSE 80 9000
CMD ["nginx", "-g", "daemon off;"]
