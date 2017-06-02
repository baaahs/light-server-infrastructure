# light-server-infrastructure

[![Stories in Ready](https://badge.waffle.io/baaahs/light-server-infrastructure.png?label=ready&title=Ready)](https://waffle.io/baaahs/light-server-infrastructure?utm_source=badge)

This project contains the necessary roles to take commodity, off-the-shelf hardware listed below and create a working BAAAHS light control server. The light control server has three main parts:

- Access point functionality allowing for 128 devices to connect and interact
- Light server, show processing and management and communication with connected OSC devices (smartphones, mainly)
- DMX control via transmition

# PARTS LIST
The parts required to build a server include:

- [Raspberry PI 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)
- [Raspberry Pi 2/3 Copper Heat Sink Heatsink](https://www.amazon.com/gp/product/B01GM9EYQ8)
- [Duinocases Industrial, Metal Enclosure](http://www.duinocases.com/store/raspberry-pi-enclosures/duinocase-b-enclosure-for-the-raspberry-pi-b/)
- [UPS PIco HV3.0A 450 mAh Stack](http://www.pimodulescart.com/shop/item.aspx?itemid=30)
- [SanDisk Extreme 16GB UHS-I/U3 Micro SDHC Memory Card](https://www.amazon.com/gp/product/B00M55BX3G)
- [DMXking ultraDMX Micro USB DMX adapter/dongle](https://www.amazon.com/gp/product/B00T8OKM98/)
- [CanaKit 5V 2.5A Raspberry Pi 3 Power Supply / Adapter / Charger (UL Listed)](https://www.amazon.com/CanaKit-Raspberry-Supply-Adapter-Charger/dp/B00MARDJZ4/)
- [Panda Wireless PAU06 300Mbps N USB Adapter](https://www.amazon.com/Panda-Wireless-PAU06-300Mbps-Adapter/dp/B00JDVRCI0)

# SERVER BUILD
To build a server do the following:

- Prepare your SD Card...
  - Insert the SanDisk SD card in your machine and ensure it's formatted FAT32 and blank.
  - Download the [NOOBS Lite](https://www.raspberrypi.org/downloads/noobs/) image from the linked page.
  - Unzip the contents of download onto the newly formatted SanDisk SD Card.
  - Eject the card and insert it into the RPI.

- Assemble your equipment...
  - The flat heat sink is affixed to the chip on the bottom of the RPI. The larger sinks are afixed to the top of the RPI.
  - The UPS PIco HAT sits on top of the RPI GPIO header PINS.
  - The SanDisk SD Card goes in the SD Card slot on the RPI.
  - Insert the RPI into the case and close the case.
  - Connect the DMXking ultraDMX adapter into a free USB port
  - Connect the Panda Wireless PAU06 into a free USB port
  - Connect Keyboard/Mouse, Ethernet and Power

- Install Raspbian...
  - Boot up your PI w/ a USB keyboard and mouse, select installation of Raspbian Lite and select the keyboard layout of US.
  - Restart your PI once the installation of Raspbian has finished.
  - Login to your PI using the credentials (user: pi, password: raspberry)
  - Run `sudo raspi-config`, select `Interfacing Options` and enable SSH, select the option to change the server name. Set the name to `baaahslights`
  - Reboot
    
You should now be able to SSH into the PI: `ssh pi@baaahslights.local`  
 
# EXECUTE PLAYBOOK
First, install ansible via brew; `brew install ansible` or via a binary/installer of your choice.

Next, execute this playbook against the `baaahslights.local` server, using a vault password obtained by contacting [Josh Durbin](https://github.com/joshdurbin).

Ex: `ansible-playbook playbook.yml -i inventory.dist --ask-vault-pass`
 
# ADMINISTRATION OF THE SERVER
There are three pathways onto the Raspberry PI lights server...

1. via the RJ45 ethernet device on a pre-existing network
2. via the internal wifi adapter on a pre-configured network
3. via the wireless network the server creates, `baaahs`, with the WPA2 key `baaahs2017`

If you're using option #1 or #2 above, you'll need to scan the network or otherwise obtain the IP assigend by the
networks DHCP subsystem. If you're using option #3, the Raspberry PI can be reached at `172.24.1.1`.

There are two web-based interfaces available:

- [OLA Daemon/interface](http://baaahslights.local:9090/new/#/) at port `9090`
- [BAAAHS Light Server](http://baaahslights.local:9990/) at port `9990`
