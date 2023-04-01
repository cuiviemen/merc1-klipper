#!/usr/bin/env bash

config="rpi.config"

pushd ~/klipper

sudo service klipper stop
git pull

make clean KCONFIG_CONFIG=$config
make menuconfig KCONFIG_CONFIG=$config
make flash KCONFIG_CONFIG=$config

if [ $? -ne 0 ]
  then
    echo "Flashing RPi failed"
    exit $?
fi

sudo service klipper start && echo "Flashing RPi completed"

popd
