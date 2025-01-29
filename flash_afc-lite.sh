#!/usr/bin/env bash

config="afc-lite.config"
canuuid="69f6e9917c33"

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
python3 ~/klipper/lib/canboot/flash_can.py -u $canuuid

popd

if [ $? -ne 0 ]
  then
    echo "Flashing AFC-Lite failed"
    exit $?
fi

echo "Flashing AFC-Lite completed"
