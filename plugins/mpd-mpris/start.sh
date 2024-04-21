#!/usr/bin/env sh
set -exv

# Exit if requested
if [ -n "$SOUND_DISABLE_MPD_MPRIS" ]; then
  echo "MPD MPRIS is disabled, exiting..."
  exit 0
fi

# Parse config
MPD_HOST=${SOUND_MPD_HOST:-"localhost"}


RUN_COMMAND=$(command -v mpd-mpris)
set -- $RUN_COMMAND --host $MPD_HOST "$@"
exec "$@"
