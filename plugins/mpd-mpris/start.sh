#!/usr/bin/env sh
set -e

# Exit if requested
if [ -n "$SOUND_DISABLE_MPD_MPRIS" ]; then
  echo "MPD MPRIS is disabled, exiting..."
  exit 0
fi

# Parse config

#DEFAULTHOST=$(ip route | awk '/default / { print $3 }')
DEFAULTHOST="localhost"
MPD_HOST=${SOUND_MPD_HOST:-"$DEFAULTHOST"}


RUN_COMMAND=$(command -v mpd-mpris)
set -- $RUN_COMMAND -no-instance --host $MPD_HOST "$@"
exec "$@"
