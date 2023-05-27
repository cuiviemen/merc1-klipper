#!/usr/bin/env bash

config="sht36.config"
canuuid="f79bb3838513"

pushd ~/klipper

sudo service klipper stop
git pull

make clean KCONFIG_CONFIG=$config
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
python3 ~/klipper/lib/canboot/flash_can.py -u $canuuid

if [ $? -ne 0 ]
  then
    echo "Flashing SHT36 failed"
    exit $?
fi

sudo service klipper start && echo "Flashing SHT36 completed"

popd
