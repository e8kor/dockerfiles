#!/bin/bash

glusterd -p /var/run/glusterd.pid --log-level $LOG_LEVEL $GLUSTERD_OPTIONS &
PID="$!"
for node in "$@"; do
    gluster peer probe $node > /dev/stdout
done
gluster peer status > /dev/stdout

tail -f /proc/$PID/fd/1