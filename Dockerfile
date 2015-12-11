FROM debian:stable

MAINTAINER minanon

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y curl samba samba-vfs-modules openssl gcc --no-install-recommends \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# install bind
RUN curl -L 'https://www.isc.org/downloads/file/bind-9-10-3/?version=tar-gz' | tar -zx -C /tmp \
    && cd /tmp/bind-9.10.3/ \
    && ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --sysconfdir=/etc/bind --localstatedir=/var --enable-threads --enable-largefile --with-libtool --enable-shared --enable-static --with-openssl=/usr --with-gssapi=/usr --with-gnu-ld --with-geoip=/usr --with-atf=no --enable-ipv6 --enable-rrl --enable-filter-aaaa --with-dlopen CFLAGS=-fno-strict-aliasing -fno-delete-null-pointer-checks -DDIG_SIGCHASE -O2 \
    && make && make install
    && cd / && rm -rf /tmp

#EXPOSE 53/udp 53/tcp
VOLUME [ "/var/lib/samba/private/" ]
ADD add_files/* /
RUN chmod 755 /*.sh

ENTRYPOINT [ "/start.sh" ]
