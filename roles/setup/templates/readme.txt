
Quick Reference:

To get a service status execute ---> systemctl status <service>
To start/stop a service execute ---> sudo systemctl start/stop <service>
To view service logs execute ---> sudo journalctl --system --follow --lines=100
To view kernel messages execute ---> dmesg --follow
To restart the server ---> sudo reboot

-------------------------------------------------------------------------------

To debug and make the entire sheep white, do the following:

 1. Stop the baaahs lights server ---> sudo systemctl stop lights
 2. Access the OLA faders console and select the illuminated light bulb setting all channels to full at ---> http://{{rpi_wlan_ip_prefix}}.1:9090/new/#/universe/0/faders

* Note * There is also a legacy UI at http://{{rpi_wlan_ip_prefix}}.1:9090/ola.html. Open that page, select "Universes" on the left, then the single Universe, "Universe 0", then the "DMX Console" tab. From that tab, select the illuminated light bulb.
* Note * It is important the the DMX Console page is closed after its used. If it is not closed and the BAAAHS lights server is online, the sheep will flicker.

-------------------------------------------------------------------------------

To map sheep panels / panel setup, do the following:

 1. Stop the baaahs lights server ---> sudo systemctl stop lights
 2. SU to the baaahs user ---> sudo su baaahs
 3. Change directory to the lights server directory ---> cd lights
 4. Execute the panel setup ---> ./panel_setup.py
 5. Run through the setup mapping panels one by one. Once done, enter "save"
 6. Quit the panel setup utility, enter "quit"
 7. Backup the existing panel setup JSON at ~/lights/data/dmx_mapping.json
 8. Copy the saved output from the mapping utility over the old mapping ---> cp -f dmx_setup.json data/dmx_mapping.json
 9. Start the baaahs lights server ---> sudo systemctl start lights

-------------------------------------------------------------------------------

Common problems and resolutions:

 1. If the DMX USB adapter is absent when the OLA daemon starts, the universe will be removed. In this case, connect or ensure the connection of the USB DMX adapter, and open the OLA console at http://{{rpi_wlan_interface_ip}}:9090 with the ID: {{dmx_universe_id}} and the name {{dmx_universe_name}}.
