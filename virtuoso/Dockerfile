FROM debian:7.7

MAINTAINER Markus Ackermann <ackermann@informatik.uni-leipzig.de>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Let container live in TZ of Germany to avoid confusion with time stamps
RUN echo 'Europe/Berlin' > /etc/timezone

# install virtuoso
RUN apt-get update
RUN apt-get install -y virtuoso-opensource

ADD init_virtuoso.sh /
RUN bash /init_virtuoso.sh

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]

EXPOSE 1111 8992

