#!/usr/bin/env sh
set -ex

# Exit if requested
if [ -n "$SOUND_DISABLE_MPD_MPRIS" ]; then
  echo "MPD MPRIS is disabled, exiting..."
  exit 0
fi

# Parse config
DEFAULT_HOST="localhost"
MPD_HOST=${SOUND_MPD_HOST:-"$DEFAULT_HOST"}


RUN_COMMAND=$(command -v mpd-mpris)
# if command starts with an option, prepend mpd-mpris
if [ "${1:0:1}" = '-' ]; then
  set -- ${RUN_COMMAND} "$@"
fi

# Add default arguments
if [ "$1" = "${RUN_COMMAND}" ]; then
  shift
  set -- ${RUN_COMMAND} -no-instance -host "${MPD_HOST}" "$@"
fi

exec "$@"
