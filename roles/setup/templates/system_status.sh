#!/bin/bash

systemctl -q is-active olad
OLAD_SERVICE_ACTIVE=$?

systemctl -q is-active lights
LIGHTS_SERVICE_ACTIVE=$?

RPI_CPU_TEMP=$(/opt/vc/bin/vcgencmd measure_temp| sed "s/[^0-9.]//g")
WIFI_CLIENTS=$(iw dev wlan1 station dump | grep Station | wc -l)

MAPPING_LASTMOD=$((($(date +%s) - $(date +%s -r /home/baaahs/lights/data/dmx_mapping.json)) / 86400))

echo "The olad service is.......$(if [ $OLAD_SERVICE_ACTIVE -eq 0 ]; then echo "active"; else echo "inactive"; fi)"
echo "The lights server is......$(if [ $LIGHTS_SERVICE_ACTIVE -eq 0 ]; then echo "active"; else echo "inactive"; fi)"
echo "# of WIFI connections.....$WIFI_CLIENTS clients"
echo "DMX mapping age...........$MAPPING_LASTMOD days"
echo "RPI CPU Temp..............$RPI_CPU_TEMP C"