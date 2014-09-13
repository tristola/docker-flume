FROM ubuntu
MAINTAINER Toni Ristola

RUN apt-get update && apt-get install -q -y --no-install-recommends wget

RUN mkdir /opt/java
RUN wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -qO- \
  https://download.oracle.com/otn-pub/java/jdk/8u20-b26/jre-8u20-linux-x64.tar.gz \
  | tar zxvf - -C /opt/java --strip 1

RUN mkdir /opt/flume
RUN wget -qO- http://archive.apache.org/dist/flume/1.5.0/apache-flume-1.5.0-bin.tar.gz \
  | tar zxvf - -C /opt/flume --strip 1


ENV JAVA_HOME /opt/java
ENV PATH /opt/flume/bin:/opt/java/bin:$PATH
VOLUME ["/opt/config/flume"]

ADD start.sh /opt/flume/start.sh
EXPOSE 44444
ENTRYPOnIT  "/opt/flume/start.sh"
