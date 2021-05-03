FROM ubuntu:20.04 as builder

WORKDIR /tmp/libnss
ENV VERSION=1.7
ENV DOCK_VERSION=0.6.1

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



FROM ubuntu:20.04
COPY --from=builder /tmp/libnss-build /
COPY --from=builder /tmp/libnss/dockerize /usr/bin/dockerize
RUN rm /usr/local/etc/libnss-mysql* \
    && mkdir -p /run/sshd
COPY libnss-mysql-root.cfg.tpl /usr/local/etc/libnss-mysql-root.cfg.tpl
COPY libnss-mysql.cfg.tpl /usr/local/etc/libnss-mysql.cfg.tpl
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY fetch-keys.py /fetch-keys.py
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server python3-pip libmysqlclient21 --no-install-recommends \
    && pip3 install mysql-connector-python \
    && sed -i '/^\(passwd\|group\|shadow\|gshadow\):/s/$/ mysql/' /etc/nsswitch.conf \
    && chmod a+x /docker-entrypoint.sh /fetch-keys.py
COPY sshd.conf /etc/ssh/sshd_config.d/sshd.conf

CMD /docker-entrypoint.sh