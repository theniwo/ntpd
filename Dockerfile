FROM ubuntu:latest

MAINTAINER theniwo <disp [at] mailbox.org>

LABEL maintainer="disp@mailbox.org"

WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

ENV TZ=Europe/Berlin

EXPOSE 123/udp

HEALTHCHECK CMD pidof ntpd || exit 1
#HEALTHCHECK CMD ntpq -np localhost || exit 1

RUN apt-get update apt-get upgrade -y && apt-get install -y ntp && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./content /

CMD ["/usr/sbin/ntpd", "-n"]





#RUN apk --update --no-cache add bash s6 openntpd tzdata \
#    && sed -i 's/#listen on/listen on/' /etc/ntpd.conf \
#    && chmod +x /usr/sbin/gosu
#

