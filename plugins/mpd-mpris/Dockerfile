
FROM balenalib/amd64-ubuntu-golang:latest as golang
ENV PATH=/go/bin:$PATH
RUN install_packages dbus
RUN git clone https://github.com/natsukagami/mpd-mpris.git \
    && cd mpd-mpris \
    && go build -v -o mpd-mpris cmd/mpd-mpris/*.go \
    && mkdir -p /go/bin/ \
    && cp mpd-mpris /go/bin/mpd-mpris \
    && cd .. \
    && rm -rf mpd-mpris

COPY start.sh /go/start.sh
CMD ["/bin/sh", "/go/start.sh"]

