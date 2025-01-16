FROM ubuntu:24.04 AS builder

WORKDIR /tmp/libnss
ENV VERSION=1.7.1
ENV DOCK_VERSION=0.7.0

RUN apt-get update
RUN apt-get install -y build-essential wget libmysqlclient-dev
RUN wget -O libnss.tar.gz https://github.com/saknopper/libnss-mysql/releases/download/v${VERSION}/libnss-mysql-${VERSION}.tar.gz
RUN wget -O dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/v${DOCK_VERSION}/dockerize-linux-amd64-v${DOCK_VERSION}.tar.gz
RUN tar -xf libnss.tar.gz
RUN tar -xf dockerize.tar.gz
RUN cd libnss-mysql-${VERSION} \
    && ./configure \
    && make \
    && make install DESTDIR=/tmp/libnss-build



FROM ubuntu:24.04
COPY --from=builder /tmp/libnss-build /
COPY --from=builder /tmp/libnss/dockerize /usr/bin/dockerize
RUN rm /usr/local/etc/libnss-mysql* \
    && mkdir -p /run/sshd /sussh/host-keys
COPY config.tpl/* /usr/local/etc/
COPY docker-entrypoint.sh /sussh/docker-entrypoint.sh
COPY fetch-keys.py /sussh/fetch-keys.py
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server python3-pip libmysqlclient21 --no-install-recommends \
    && pip3 install mysql-connector-python --break-system-packages \
    && sed -i '/^\(passwd\|group\|shadow\|gshadow\):/s/$/ mysql/' /etc/nsswitch.conf \
    && chmod 555 /sussh/docker-entrypoint.sh /sussh/fetch-keys.py \
    && chown root /sussh/docker-entrypoint.sh /sussh/fetch-keys.py \
    && sed -i '/motd/ s/^#*/# /' /etc/pam.d/sshd \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean autoclean
COPY sshd.conf /etc/ssh/sshd_config.d/sshd.conf

VOLUME [ "/sussh/host-keys" ]

CMD ["/sussh/docker-entrypoint.sh"]
