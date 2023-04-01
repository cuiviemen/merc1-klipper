#!/usr/bin/env bash

scripts=(flash_mcu.sh flash_rpi.sh)

for script in "${scripts[@]}"
do
  ./$script
  if [ $? -ne 0 ]
    then
      exit $?
  fi
done

exit $?
