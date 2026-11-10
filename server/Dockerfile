
FROM debian:bookworm-slim AS compilacion

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    ca-certificates \
    libssl-dev \
    libsodium-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN curl -fL https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-1.0.54.tar.gz -o pure-ftpd.tar.gz \
    && tar -xzf pure-ftpd.tar.gz \
    && cd pure-ftpd-1.0.54 \
    && ./configure --prefix=/usr/local --with-puredb --with-tls --without-capabilities --without-pam \
    && make -j2 \
    && make install

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    passwd \
    libssl3 \
    libsodium23 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=compilacion /usr/local/ /usr/local/

RUN groupadd ftpgroup \
    && useradd -g ftpgroup -d /home/ftpusers -s /usr/sbin/nologin ftpuser \
    && mkdir -p /etc/pure-ftpd /home/ftpusers

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 21 30000-30009

CMD ["/start.sh"]
