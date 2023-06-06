#!/usr/bin/env bash

scripts=(flash_rpi.sh flash_sht36.sh flash_mcu.sh)

pushd ~/klipper
sudo service klipper stop
git pull
popd

for script in "${scripts[@]}"
do
  ./$script
  if [ $? -ne 0 ]
    then
      exit $?
  fi
done

exit $?
