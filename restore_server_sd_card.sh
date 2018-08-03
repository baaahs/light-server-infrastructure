#!/usr/bin/env bash

diskutil list

read -p "Enter device name (for example for device /dev/disk2 enter disk2): " device
diskutil unmountDisk /dev/$device

read -p "Enter the gzip compressed image path: " image_path
gzip -dc $image_path | dd bs=4m of=/dev/r$device
