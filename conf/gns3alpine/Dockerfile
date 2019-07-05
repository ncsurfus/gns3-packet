FROM alpine:edge

RUN apk add --update --no-cache tini cpulimit docker dynamips qemu-img ubridge vpcs iouyap \
    qemu-system-x86_64 'gns3-server=2.1.21-r0'

ADD ./start.sh /start.sh
ADD ./config.ini /config.ini

RUN chmod +x /start.sh && mkdir /data
WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT [ "/start.sh" ]
