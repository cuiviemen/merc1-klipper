#!/usr/bin/env bash

config="sht36.config"
canuuid="a06c087b27e4"

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
python3 ~/klipper/lib/canboot/flash_can.py -u $canuuid

popd

if [ $? -ne 0 ]
  then
    echo "Flashing SHT36 failed"
    exit $?
fi

echo "Flashing SHT36 completed"
