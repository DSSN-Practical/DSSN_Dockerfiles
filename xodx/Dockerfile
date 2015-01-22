FROM debian:7.7

MAINTAINER Markus Ackermann <ackermann@informatik.uni-leipzig.de>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Let container live in TZ of Germany to avoid confusion with time stamps
RUN echo 'Europe/Berlin' > /etc/timezone

# install some basic packages
# install the nginx server with PHP
# install virtuoso
RUN apt-get update
RUN apt-get install -y \
    git make curl unzip \
    nginx-light php5-fpm php5-odbc php5-curl

# clone ontowiki and get its dependencies
RUN git clone https://github.com/AKSW/xodx.git /var/www/
#COPY xodx_repo /xodx_repo
#RUN git clone --single-branch -b host_debug /xodx_repo /var/www/
RUN cd /var/www/ && make install-fb
RUN cp /var/www/config.ini-dist /var/www/config.ini

# configure the ontowiki site for nginx
COPY xodx.conf /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/xodx.conf /etc/nginx/sites-enabled/

# configure odbc for virtuoso
COPY virtodbc.so /usr/local/lib/
COPY odbc.ini /etc/

# Add startscript and start
COPY start.sh /start.sh
COPY xodx-docker.fig /xodx-docker.fig
CMD ["/bin/bash", "/start.sh"]

# expose the HTTP port to the outer world
EXPOSE 80
