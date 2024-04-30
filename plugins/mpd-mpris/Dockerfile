FROM balenalib/amd64-ubuntu-golang:latest as golang
COPY dbus-anonymous.patch /tmp/dbus-anonymous.patch
RUN set -xve \
    && git clone https://github.com/natsukagami/mpd-mpris.git \
    && mkdir -p /app/bin \
    && cd mpd-mpris \
    && git apply /tmp/dbus-anonymous.patch \
    && go build -v -o /app/bin/mpd-mpris cmd/mpd-mpris/*.go \
    && cd .. \
    && rm -rf mpd-mpris

FROM balenalib/amd64-debian:latest-run as base
ENV PATH=/app/bin:$PATH
RUN mkdir -p /app/bin
COPY --from=golang /app/bin/mpd-mpris /app/bin/mpd-mpris
RUN install_packages dbus dbus-x11
WORKDIR /app
COPY start.sh /go/start.sh
ENTRYPOINT ["/go/start.sh"]

