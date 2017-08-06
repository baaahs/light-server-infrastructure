
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

