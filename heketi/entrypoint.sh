#!/bin/bash

heketi --config=/etc/heketi/heketi.json --disable-auth=true &

PID="$!"

heketi-cli topology load --json=/etc/heketi/topology.json > /dev/stdout

tail -f /proc/$PID/fd/1