#!/usr/bin/env sh
set -ex

# Exit if requested
if [ -n "$SOUND_DISABLE_MPD_MPRIS" ]; then
  echo "MPD MPRIS is disabled, exiting..."
  exit 0
fi

# Parse config

#DEFAULT_HOST=$(ip route | awk '/default / { print $3 }')
DEFAULT_HOST="localhost"
MPD_HOST=${SOUND_MPD_HOST:-"$DEFAULT_HOST"}


RUN_COMMAND=$(command -v mpd-mpris)
set -- ${RUN_COMMAND} -dbus-auth="anonymous" -no-instance -host "${MPD_HOST}" "$@"
#set -- /bin/bash -c "tail -f /dev/null" "$@"
exec "$@"
