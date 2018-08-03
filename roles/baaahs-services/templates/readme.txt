
Quick Reference:

To get a service status execute ---> systemctl status <service>
To start/stop a service execute ---> sudo systemctl start/stop <service>
To view service logs execute ------> sudo journalctl --system --follow --lines=100
To view kernel messages execute ---> dmesg --follow
To restart the server -------------> sudo reboot

Web-endpoints:

OLA --------------------> http://{{rpi_wlan_interface_ip}}:9090/ola.html
OLA New (beta) ---------> http://{{rpi_wlan_interface_ip}}:9090/new/#/
BAAAHS Lights Server ---> http://{{rpi_wlan_interface_ip}}:9990/
OSC Layout Server ------> http://{{rpi_wlan_interface_ip}}:9658/

Startup notes:

The server starts up in white out mode, sending full signal to all frames ([255] * 512). In order to run shows you must
stop the whiteout service and start the lights service. You must do this each time the server is restarted! To do so
execute the script ./go_lights.sh and to flip back, execute ./go_whiteout.sh.

