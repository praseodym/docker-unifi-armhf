# Docker image for UniFi 5 Controller on Raspberry Pi (32-bit)

Available from https://hub.docker.com/r/praseodym/unifi-armhf/ (`docker pull praseodym/unifi-armhf`).

Example Docker Compose setup (save as `docker-compose.yml`, run with `docker-compose up -d`):

```
version: '2'
services:
  unifi:
    image: praseodym/unifi-armhf:unifi5
    restart: always
    network_mode: host
    volumes:
      - /srv/unifi/unifi-data:/usr/lib/unifi/data
```
