#!/bin/bash
set -e
set -x

. docker/config.sh
if [ ! -z "$1"]; then TARGET_DIR="$1"; fi

if [ -d "$TARGET_DIR" ]; then rm -rf "$TARGET_DIR"/*
elif [ -e "$TARGET_DIR" ]; then rm "$TARGET_DIR"
else mkdir "$TARGET_DIR"
fi
docker build -f docker/Dockerfile.build -t domoticz-build .
docker run -v "$(pwd)":/domoticz -v "$(pwd)"/"$TARGET_DIR":/opt/domoticz --rm --user $(id -u):$(id -g) -it domoticz-build /domoticz/docker/build.sh
