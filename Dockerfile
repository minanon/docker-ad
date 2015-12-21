FROM debian:stable

MAINTAINER minanon

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y curl samba samba-vfs-modules openssl --no-install-recommends \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# create shared directory
RUN mkdir -p /share
VOLUME [ "/share" ]

# setup setting directory and script files
VOLUME [ "/var/lib/samba/private/" ]
VOLUME [ "/etc/samba" ]
ADD add_files/start.sh /start.sh
ADD add_files/scripts /scripts
RUN chmod 755 -R /start.sh /scripts

ENTRYPOINT [ "/start.sh" ]
