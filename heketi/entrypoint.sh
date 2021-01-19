#!/bin/bash

/usr/bin/heketi --config=/etc/heketi/heketi.json --disable-auth=true &

/usr/bin/heketi-cli topology load --json=/etc/heketi/topology.json &
