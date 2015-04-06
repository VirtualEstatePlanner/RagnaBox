FROM ubuntu:14.04

MAINTAINER George Georgulas IV <georgegeorgulas@gmail.com>

USER root

ENV HOME /root

ENV DEBIAN_FRONTEND noninteractive

RUN \
 apt-get update && \
 apt-get dist-upgrade -y && \
 apt-get install -y --force-yes --no-install-recommends \
  gcc  \
  git \
  make \
  libmysqlclient-dev \
  mysql-client \
  mysql-server \
  zlib1g-dev \
  libpcre3-dev

ADD /rathena-master/ /usr/bin/rAthena/
WORKDIR /usr/bin/rAthena/

RUN \
  ./configure --enable-packetver=20131223 && \
  make server && \
  chmod a+x login-server && \
  chmod a+x char-server && \
  chmod a+x map-server && \
  chmod a+x athena-start

RUN \
 apt-get remove -y \
  gcc \
  git \
  make

Add /rathena-master/sql-files/ /var/lib/mysql/
ADD import.sql /var/lib/mysql/
WORKDIR /var/lib/mysql/

ADD startup.sh /
# CMD [“bash"]

ENTRYPOINT ["/startup.sh"]

VOLUME /var/lib/mysql
VOLUME /usr/bin/rAthena

# Open ssh, mysql, char-server, login-server, map-server   ports
EXPOSE 22   3306   5121         6121          6900

# run with 

# docker run -i -t --rm -v /var/lib/mysql -p 20000:22 -p 20001:3306 -p 20002:5121 -p 20003:5900 -p 20004:6080 -p 20005:6121 -p 20006:6900 -e USER=root --name BoxOfRags georgegeorgulasiv/ragnabox 

# or similar