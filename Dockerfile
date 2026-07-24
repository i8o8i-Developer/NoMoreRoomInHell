FROM steamcmd/steamcmd:ubuntu-22

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        lib32gcc-s1 \
        lib32stdc++6 \
        libcurl4-gnutls-dev:i386 \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/steam/nmrih

COPY Entrypoint.sh /Entrypoint.sh
RUN chmod +x /Entrypoint.sh

EXPOSE 27015/udp 27015/tcp 27020/udp

ENTRYPOINT ["/Entrypoint.sh"]