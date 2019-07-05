FROM ubuntu:18.04

# Install Dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y software-properties-common wget docker.io language-pack-en
RUN add-apt-repository ppa:gns3/ppa -y

# Fix locale issues
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Install GNS3 Server
RUN apt-get install -y 'gns3-server=2.1.21~*'

# Install GNS3 IOU
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y gns3-iou

# Free up space from apt
RUN rm -rf /var/lib/apt/lists/*

# Add IOU License
WORKDIR /
RUN wget https://github.com/ncsurfus/goioulic/releases/download/v0.1.0/linux_amd64_goioulic
RUN chmod +x linux_amd64_goioulic
RUN echo "127.0.0.254 xml.cisco.com" >> /etc/hosts 

# Add Config / Start scripts
ADD ./start.sh /start.sh
ADD ./config.ini /config.ini
RUN chmod +x /start.sh

# Create Data Directory
WORKDIR /data
VOLUME ["/data"]

ENTRYPOINT [ "/start.sh" ]
