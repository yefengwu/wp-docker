FROM mysql:5.6

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

WORKDIR /etc/apt
RUN rm -rf /etc/apt/sources.list
COPY ./sources.list /etc/apt/sources.list

WORKDIR /www
ADD ./db_init.sql /www/db_init.sql
COPY ./db.sh /root
ADD ./wordpress-5.4.1-zh_CN.tar.gz /www 
RUN apt-get -q update \
 && apt-get -q -y install php7.0 php7.0-fpm php7.0-mysql \
 && apt-get -q -y install nginx \
 && apt-get -q -y install procps \
 && chown -R www-data wordpress \
 && apt-get clean \
 && echo "" >> ~/.bashrc \
 && echo "service mysql start" >> ~/.bashrc \
 && echo "service php7.0-fpm start" >> ~/.bashrc \
 && echo "service nginx start" >> ~/.bashrc   \
 && chown -R mysql:mysql /var/lib/mysql


ADD ./default /etc/nginx/sites-available/default

WORKDIR /root

EXPOSE 80

ENTRYPOINT ["/bin/bash"]
