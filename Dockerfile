FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        icedtea-netx \
        xvfb \
        x11vnc \
        novnc \
        websockify \
        evilwm \
        xfonts-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
