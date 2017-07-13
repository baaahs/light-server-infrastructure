#!/bin/bash

systemctl -q is-active olad
OLAD_SERVICE_ACTIVE=$?

systemctl -q is-active lights
LIGHTS_SERVICE_ACTIVE=$?

systemctl -q is-active osc_layout_server
OSC_LAYOUT_SERVICE_ACTIVE=$?

RPI_CPU_TEMP=$(/opt/vc/bin/vcgencmd measure_temp| sed "s/[^0-9.]//g")
WIFI_CLIENTS=$(iw dev wlan1 station dump | grep Station | wc -l)

MAPPING_LASTMOD=$((($(date +%s) - $(date +%s -r /home/baaahs/lights/data/dmx_mapping.json)) / 86400))

PI_VOLTAGE=$(pi_voltage)
PICO_UPS_POWERMODE=$(pico_ups_powermode)
PICO_UPS_BATTERY_CHARGE_PERCENTAGE=$(pico_ups_battery_charge_percentage)
PICO_UPS_BATTERY_VOLTAGE=$(pico_ups_battery_voltage)

echo "Service Stats:"
echo "The olad service is..........$(if [ $OLAD_SERVICE_ACTIVE -eq 0 ]; then echo "active"; else echo "inactive"; fi)"
echo "The lights server is.........$(if [ $LIGHTS_SERVICE_ACTIVE -eq 0 ]; then echo "active"; else echo "inactive"; fi)"
echo "The OSC layout server is.....$(if [ $OSC_LAYOUT_SERVICE_ACTIVE -eq 0 ]; then echo "active"; else echo "inactive"; fi)"
echo "DMX mapping age..............$MAPPING_LASTMOD days"
echo ""
echo "Hardware Stats:"
echo "# of WIFI connections........$WIFI_CLIENTS clients"
echo "RPI CPU Temp.................$RPI_CPU_TEMP C"
echo "Power mode...................$PICO_UPS_POWERMODE"
echo "Battery Charge Percentage....$PICO_UPS_BATTERY_CHARGE_PERCENTAGE"
echo "Battery Voltage..............$PICO_UPS_BATTERY_VOLTAGE"
echo "PI Voltage...................$PI_VOLTAGE"