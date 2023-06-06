#!/usr/bin/env bash

config="octopuspro429.config"
device="/dev/serial/by-id/usb-Klipper_stm32f429xx_210040001450304738313820-if00"
board="btt-octopus-pro-f429-v1.0"

pushd ~/klipper

./scripts/flash-sdcard.sh -c $device $board

popd
