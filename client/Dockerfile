
FROM alpine:3.23

RUN apk add --no-cache \
    build-base \
    curl \
    ca-certificates \
    tar \
    readline-dev \
    zlib-dev \
    openssl-dev \
    expat-dev \
    libidn2-dev \
    ncurses-dev \
    gettext-dev

WORKDIR /tmp

RUN curl -fL https://github.com/lavv17/lftp/releases/download/v4.9.3/lftp-4.9.3.tar.gz -o lftp.tar.gz \
    && tar -xzf lftp.tar.gz \
    && cd lftp-4.9.3 \
    && ./configure --prefix=/usr/local --with-openssl \
    && make -j2 \
    && make install \
    && lftp --version

CMD ["sleep", "infinity"]

