FROM debian:stable

MAINTAINER minanon

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y curl samba samba-vfs-modules openssl --no-install-recommends \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# setup setting directory and script files
COPY "add_files/start.sh" "/start.sh"
COPY "add_files/scripts" "/scripts"
RUN chmod 755 -R /start.sh /scripts

# extenal setting
VOLUME "/var/lib/samba" "/etc/samba"
EXPOSE 88/tcp 88/udp 135/tcp 137/udp 138/udp 139/tcp 389/tcp 389/udp 445/tcp 464/tcp 464/udp 636/tcp 1024/tcp 3268/tcp 3269/tcp

ENTRYPOINT [ "/start.sh" ]
