#!/usr/bin/env bash

if [[ -n "$SOUND_DISABLE_MPD" ]]; then
  echo "MPD is disabled, exiting..."
  exit 0
fi


DEVNAME=${SOUND_MPD_DEVNAME:-"/dev/sda1"}

if [[ -z $DEVNAME ]]; then
  echo "Invalid device name: $DEVNAME"
  exit 1
fi

if [[ ! -e "$DEVNAME" ]]; then
  echo "Device $DEVNAME not found..."
fi

DESTINATION_FALLBACK=/var/lib/mpd/fallback
DESTINATION=/var/lib/mpd

if [[ -e "$DEVNAME" ]]; then
  # Mount external filesystem
  # Doc: https://docs.balena.io/learn/develop/runtime/#mounting-external-storage-media
  if findmnt -rno SOURCE,TARGET $DEVNAME > /dev/null; then
      echo "Device $DEVNAME is already mounted!"
  else
      echo "Mounting $DEVNAME to $DESTINATION"
      mkdir -p $DESTINATION
      mount "$DEVNAME" "$DESTINATION"
  fi
else
  echo "Device $DEVNAME not found, using fallback..."
  rm -Rf ${DESTINATION}/*
  rm -Rf ${DESTINATION_FALLBACK}/*
  mkdir -p ${DESTINATION_FALLBACK}/playlists && ln -s ${DESTINATION_FALLBACK}/playlists ${DESTINATION}/playlists
  mkdir -p ${DESTINATION_FALLBACK}/music && ln -s ${DESTINATION_FALLBACK}/music ${DESTINATION}/music
  touch ${DESTINATION_FALLBACK}/database && ln -s ${DESTINATION_FALLBACK}/database ${DESTINATION}/database
  touch ${DESTINATION_FALLBACK}/state && ln -s ${DESTINATION_FALLBACK}/state ${DESTINATION}/state
fi

mkdir -p $DESTINATION/playlists
mkdir -p $DESTINATION/music

# Wait for pulseaudio to start
PORT=$(echo $PULSE_SERVER | awk -F: '{ print $3 }')
PORT=${PORT:=4317}
while [ "$(netstat -tln | grep $PORT)" == "" ]; do sleep 5; echo "Waiting for pulseaudio to start"; done

# Start MPD
mpdcommand=$(command -v mpd)

# SOUND_MPD_VERBOSE: Run mpc in verbose mode
if [[ -z ${SOUND_MPD_VERBOSE+x} ]]; then
  set -- "$@" \
    --verbose
fi


set -- $mpdcommand --no-daemon --stderr 
 "$@"
exec "$@"
