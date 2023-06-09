#!/usr/bin/env bash

config="rpi.config"

pushd ~/klipper

make clean KCONFIG_CONFIG=$config
make menuconfig KCONFIG_CONFIG=$config
make flash KCONFIG_CONFIG=$config

popd

if [ $? -ne 0 ]
  then
    echo "Flashing RPi failed"
    exit $?
fi

echo "Flashing RPi completed"
