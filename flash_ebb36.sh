#!/usr/bin/env bash

config="ebb36.config"
canuuid="35b1e3d1fc43"

pushd ~/klipper

make clean
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
python3 ~/klipper/lib/canboot/flash_can.py -u $canuuid

popd

if [ $? -ne 0 ]
  then
    echo "Flashing EBB36 failed"
    exit $?
fi

echo "Flashing EBB36 completed"
