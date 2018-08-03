#!/bin/bash

sudo systemctl stop lights
sudo systemctl start whiteout

systemctl -q is-active lights
LIGHTS_SERVICE_ACTIVE=$?

systemctl -q is-active whiteout
WHITE_OUT_SERVICE_ACTIVE=$?

echo
echo "The lights server is.........$(if [ $LIGHTS_SERVICE_ACTIVE -eq 0 ]; then echo "active"; else echo "inactive"; fi)"
echo "The whiteout server is.......$(if [ $WHITE_OUT_SERVICE_ACTIVE -eq 0 ]; then echo "active"; else echo "inactive"; fi)"