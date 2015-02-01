FROM debian:7.7

MAINTAINER Markus Ackermann <ackermann@informatik.uni-leipzig.de>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Let container live in TZ of Germany to avoid confusion with time stamps
ENV TZ Europe/Berlin

# fix for pseudo-terminals 
ENV TERM xterm

# install virtuoso
RUN apt-get update
RUN apt-get install -y virtuoso-opensource

ENTRYPOINT ["/bin/bash"]


EXPOSE 1111 8990

COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]

COPY virtuoso.ini /etc/virtuoso-opensource-6.1/virtuoso.ini
COPY init_virtuoso.sh /
RUN bash /init_virtuoso.sh

# install diagnostic tooling (TODO: leave these out later)
# RUN apt-get install -y emacs23-nox net-tools procps htop nmap

