#!/usr/bin/env bash

config="octopuspro429.config"
device="/dev/serial/by-id/usb-Klipper_stm32f429xx_210040001450304738313820-if00"
board="btt-octopus-pro-f429-v1.0"

pushd ~/klipper

sudo service klipper stop
git pull

make clean KCONFIG_CONFIG=$config
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config
./scripts/flash-sdcard.sh $device $board

if [ $? -ne 0 ]
  then
    echo "Flashing MCU failed"
    exit $?
fi

echo "Issuing RESTART on MCU"

sudo service klipper start && sleep 3 && sudo echo RESTART > /tmp/printer

sudo service klipper stop
./scripts/flash-sdcard.sh -c $device $board && sudo service klipper start && echo "Flashing MCU completed"

popd
