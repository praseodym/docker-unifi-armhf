FROM arm32v7/debian:jessie

VOLUME ["/usr/lib/unifi/data"]

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://archive.raspberrypi.org/debian/ jessie main" > \
    /etc/apt/sources.list.d/raspi.list && \
    apt-key adv --keyserver keys.gnupg.net --recv 82B129927FA3303E
RUN echo "deb http://www.ubnt.com/downloads/unifi/debian unifi5 ubiquiti" > \
    /etc/apt/sources.list.d/ubiquiti.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50

RUN apt-get update && \
    apt-get install -y --no-install-recommends oracle-java8-jdk unifi && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6789/tcp 8080/tcp 8081/tcp 8443/tcp 8843/tcp 8880/tcp 3478/udp

WORKDIR /usr/lib/unifi/data

ENTRYPOINT ["/usr/bin/java", "-Xmx512M", "-jar", "/usr/lib/unifi/lib/ace.jar"]
CMD ["start"]
