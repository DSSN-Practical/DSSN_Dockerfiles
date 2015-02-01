FROM debian:7.7

# This Dockerfile has been adopted based on previous work by N. Arndt (https://github.com/AKSW/xodx.docker)
MAINTAINER Markus Ackermann <ackermann@informatik.uni-leipzig.de>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Let container live in TZ of Germany to avoid confusion with time stamps
ENV TZ Europe/Berlin

# fix for pseudo-terminals
ENV TERM xterm

# install some basic packages: nginx server with PHP
RUN apt-get update
RUN apt-get install -y \
    git make curl unzip \
    nginx-light php5-fpm php5-odbc php5-curl

# install diagnostic tooling (TODO: leave these out later)
RUN apt-get install -y emacs23-nox net-tools procps htop nmap

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

#old position of odbc setup

ENTRYPOINT ["/bin/bash"]

# Add startscript and start
COPY start.sh /start.sh
COPY xodx-docker.fig /xodx-docker.fig
CMD ["/start.sh"]

# expose the HTTP port to the outer world
EXPOSE 80

# install diagnostic tooling (TODO: leave these out later)
RUN apt-get install -y emacs23-nox net-tools procps htop nmap virtuoso-opensource-6.1-bin

# configure odbc for virtuoso (TODO: move this back to its old place later)
COPY virtodbc.so /usr/local/lib/
COPY odbc.ini /etc/
