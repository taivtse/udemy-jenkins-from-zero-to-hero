FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

# Installing nginx 
RUN yum -y install nginx

# Installing PHP
RUN yum -y --enablerepo=remi,remi-php56 install nginx php-fpm php-common php-mysqlnd

# Installing supervisor
RUN yum -y install epel-release && \
    yum -y install python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install supervisor

# Adding the configuration file of the nginx
ADD ./conf/nginx.conf /etc/nginx/nginx.conf
ADD ./conf/default.conf /etc/nginx/conf.d/default.conf

# Adding the configuration file of the Supervisor
ADD ./conf/supervisord.conf /etc/

# Adding the default file
ADD index.php /var/www/html/index.php

# Set the port to 80 
EXPOSE 80

# Executing supervisord
# CMD ["supervisord", "-n"]

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh
