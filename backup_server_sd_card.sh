#!/usr/bin/env bash

diskutil list

read -p "Enter device name (for example for device /dev/disk2 enter disk2): " device
diskutil unmountDisk /dev/$device

write_location=~/baaahs_lights_server_`date +%d%m%Y`.img
echo
echo "Writing compressed image to $write_location"
sudo dd bs=1m if=/dev/r$device | gzip > $write_location
