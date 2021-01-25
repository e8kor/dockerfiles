#!/bin/bash
echo "Starting heketi"
heketi --config=/etc/heketi/heketi.json > /dev/stdout &

PID="$!"
echo "Service is running pid: ${PID}"

heketi-cli topology load --json=/etc/heketi/topology.json > /dev/stdout
echo "topoloty loaded"

if [ -f "/proc/$PID/fd/1" ]; then
    echo "tail for pid logs" 
    tail -f /proc/$PID/fd/1
else
    echo "no log file defined"
    tail -f /entrypoint.sh
fi
