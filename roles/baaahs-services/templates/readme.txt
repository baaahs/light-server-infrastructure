
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

-------------------------------------------------------------------------------

To debug and make the entire sheep white, do the following:

 1. Stop the baaahs lights server ---> sudo systemctl stop lights
 2. Access the OLA faders console and select the illuminated light bulb setting all channels to full at ---> http://{{rpi_wlan_interface_ip}}:9090/new/#/universe/0/faders

-------------------------------------------------------------------------------

To map sheep panels / panel setup, do the following:

 1. Stop the baaahs lights server ---------------------> sudo systemctl stop lights
 2. Change directory to the lights server directory ---> cd lights
 3. Execute the panel setup ---------------------------> ./panel_setup.py
 4. Run through the setup mapping panels one by one. Once done, enter "save"
 5. Quit the panel setup utility, enter "quit"
 6. Backup the existing panel setup JSON at ~/lights/data/dmx_mapping.json
 7. Copy the saved output from the mapping utility over the old mapping ---> cp -f dmx_setup.json data/dmx_mapping.json
 8. Start the baaahs lights server --------------------> sudo systemctl start lights

-------------------------------------------------------------------------------

Common problems and resolutions:

 1. If the DMX USB adapter is absent when the OLA daemon starts, the universe will be removed. In this case, connect or ensure the connection of the USB DMX adapter, and open the OLA console at http://{{rpi_wlan_interface_ip}}:9090 with the ID: {{dmx_universe_id}} and the name {{dmx_universe_name}}.

