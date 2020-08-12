FROM ubuntu:latest

MAINTAINER theniwo <disp [at] mailbox.org>

LABEL maintainer="disp@mailbox.org"

WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

ENV TZ=UTC

EXPOSE 123/udp

#HEALTHCHECK CMD pidof ntpd || exit 1
HEALTHCHECK CMD ntpq -np localhost || exit 1

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y ntp
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*

COPY ./content /

CMD ["/usr/sbin/ntpd", "-n"]





#RUN apk --update --no-cache add bash s6 openntpd tzdata \
#    && sed -i 's/#listen on/listen on/' /etc/ntpd.conf \
#    && chmod +x /usr/sbin/gosu
#

