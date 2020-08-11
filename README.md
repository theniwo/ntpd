# ntpd
Network Time Daemon

# Usage


```
docker run -d \
        --name=ntpd \
        --restart=always \
        --publish=123:123/udp \
        --cap-add=SYS_TIME \
        --memory 64M \
        --cpu-quota "25000" \
        -e TZ=Europe/Berlin \
        theniwo/ntpd
```

# Testing
```
ntpq -np IP
ntpdate -q IP
```

**CONTACT**

[disp@mailbox.org](mailto:disp@mailbox.org)

**LINKS**

[Docker Hub](https://hub.docker.com/repository/docker/theniwo/ntpd)

