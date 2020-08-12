# ntpd
Network Time Daemon

# Usage

Change the TZ-Variable to your timezone.

```
docker run -d \
        --name=ntpd \
        --restart=always \
        --publish=123:123/udp \
        --cap-add=SYS_TIME \
        --memory 64M \
        --cpu-quota "25000" \
        -e TZ=Europe/Berlin \
	-v ntpd_logs:/var/log \
        theniwo/ntpd
```

This ntp.conf is configured for a "192.168.1.0/24" network. If you have a different network,
you have to provide your own ntp.conf like in this example:

```
	[...]
	-v ./ntp.conf:/etc/ntp.conf \
	[...]
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

