#!/bin/bash
set -e

. docker/config.sh
if [ ! -z "$1"]; then TARGET_DIR="$1"; fi

docker build -f docker/Dockerfile.run -t domoticz-run .
docker run -v "$(pwd)"/"$TARGET_DIR":/opt/domoticz -v /etc/timezone:/etc/timezone -v /etc/localtime:/etc/localtime --rm --user $(id -u):$(id -g) -p 8082:8082 --name domoticz -d domoticz-run /opt/domoticz/domoticz -www 8082
