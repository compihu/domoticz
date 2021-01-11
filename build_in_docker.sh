#!/bin/bash
set -e

if [ -d domoticz ]; then rm -rf domoticz/*
elif [ -e domoticz ]; then rm domoticz
else mkdir domoticz
fi
docker build -f docker/Dockerfile.build -t domoticz-build .
docker run -v "$(pwd)":/domoticz -v "$(pwd)"/domoticz:/opt/domoticz --rm --user $(id -u):$(id -g) domoticz-build /domoticz/docker/build.sh
