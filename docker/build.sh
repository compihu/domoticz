#!/bin/bash
set -e
set -x

cd /domoticz
cmake -DCMAKE_BUILD_TYPE=Release CMakeLists.txt
make -j $(nproc)
make install
cd /opt/domoticz
tar cav . | xz >/domoticz/domoticz.tar.xz
