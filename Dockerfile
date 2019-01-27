FROM alpine
MAINTAINER Suvendu Mandal suvendu.mandal@gmail.com

RUN apk --update add openjdk8-jre
CMD ["/usr/bin/java", "-version"]

RUN apk update && apk add wget && rm -rf /var/cache/apk/*
RUN apk add tar
WORKDIR /home
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz
RUN tar -xf apache-tomcat-9.0.14.tar.gz
WORKDIR /home/apache-tomcat-9.0.14/bin

WORKDIR /home/apache-tomcat-9.0.14/webapps/
CMD mkdir suvendu
COPY index.html suvendu/

CMD ["/home/apache-tomcat-9.0.14/bin/catalina.sh", "run"]
EXPOSE 8080
