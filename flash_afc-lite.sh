#!/usr/bin/env bash

config="afc-lite.config"
canuuid="69f6e9917c33"

pushd ~/klipper

make clean KCONFIG_CONFIG=$config
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config

python3 ~/katapult/scripts/flashtool.py -i can0 -r -u $canuuid
python3 ~/katapult/scripts/flashtool.py -i can0 -f ~/klipper/out/klipper.bin -u $canuuid

if [ $? -ne 0 ]
  then
    popd
    echo "Flashing AFC-Lite failed"
    exit $?
fi

popd
echo "Flashing AFC-Lite completed"
exit $?
