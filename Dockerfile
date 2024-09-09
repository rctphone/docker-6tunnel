FROM alpine:3

ARG TUNNEL_VERSION=0.13
ARG TUNNEL_URL=https://github.com/wojtekka/6tunnel/releases/download/${TUNNEL_VERSION}/6tunnel-${TUNNEL_VERSION}.tar.gz

RUN set -xe \
&& apk add --no-cache build-base curl tar \
&& mkdir 6tunnel \
&& cd 6tunnel \
&& curl -sSL $TUNNEL_URL | tar xz --strip 1 \
&& ./configure --prefix=/usr --sysconfdir=/etc/6tunnel \
&& make install \
&& mv ./6tunnel /usr/bin/ \
&& cd .. \
&& rm -rf 6tunnel \
&& apk del build-base curl tar

ENTRYPOINT ["6tunnel"]