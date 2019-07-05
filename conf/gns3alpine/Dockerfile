FROM alpine:3.10

RUN apk add --update --no-cache \
    'tini=0.18.0-r0' \
    'cpulimit=0.2-r0' \
    'docker=18.09.7-r0' \
    'dynamips=0.2.20-r1' \
    'qemu-img=4.0.0-r1' \
    'ubridge=0.9.16-r0' \
    'vpcs=0.8-r0' \
    'iouyap=0.97-r1' \
    'qemu-system-x86_64=4.0.0-r1' \
    'gns3-server=2.1.21-r0'

ADD ./start.sh /start.sh
ADD ./config.ini /config.ini

RUN chmod +x /start.sh && mkdir /data
WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT [ "/start.sh" ]
