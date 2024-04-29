#!/bin/bash



PORT=${DBUS_PORT:-55884}
ADDRESS=${DBUS_ADDRESS:-tcp:host=0.0.0.0,bind=0.0.0.0,port=$PORT}
CONFIG=${DBUS_CONFIG:-"session.conf"}

echo "DBUS starting: $CONFIG $ADDRESS"

mkdir -p /var/run/dbus/
dbus-daemon --config-file=/usr/src/app/$CONFIG \
	    --nofork \
	    --address=$ADDRESS \
	    --print-address