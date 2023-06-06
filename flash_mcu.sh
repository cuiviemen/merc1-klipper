#!/usr/bin/env bash

config="octopuspro429.config"
device="/dev/serial/by-id/usb-Klipper_stm32f429xx_210040001450304738313820-if00"
board="btt-octopus-pro-f429-v1.0"

function pause(){
   while read -r -t 0.001; do :; done # dump the buffer
 read -n1 -rsp "Powercycle is required to apply the firmware. Press any key to shutdown host or Ctrl+C to exit..."
}

pushd ~/klipper

make clean KCONFIG_CONFIG=$config
make menuconfig KCONFIG_CONFIG=$config
make KCONFIG_CONFIG=$config

./scripts/flash-sdcard.sh $device $board
pause
sudo shutdown -h now
