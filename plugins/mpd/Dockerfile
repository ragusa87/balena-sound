FROM balenalib/amd64-alpine
ENV PULSE_SERVER=tcp:localhost:4317
ENV UDEV=on

RUN apk add --no-cache mpd mpc

# Install filesytem dependencies
RUN install_packages findmnt util-linux grep


RUN mkdir -p /usr/src/mpd

COPY start.sh /usr/src/mpd/start.sh
COPY mpd.conf /etc/mpd.conf

USER root
CMD ["/bin/bash", "/usr/src/mpd/start.sh"]
