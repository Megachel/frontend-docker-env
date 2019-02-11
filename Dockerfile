FROM ubuntu:18.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y nginx mysql-server php7.2 php7.2-json php-imagick php7.2-mysql php-redis php-curl php-xml
RUN mkdir /app
WORKDIR /opt
RUN php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --disable-tls
RUN ln -s /opt/composer.phar /bin
ADD www /app
WORKDIR /app
RUN composer.phar install
#ENTRYPOINT ["/bin/bash"]
