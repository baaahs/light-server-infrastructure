# light-server-infrastructure

[![Stories in Ready](https://badge.waffle.io/baaahs/light-server-infrastructure.png?label=ready&title=Ready)](https://waffle.io/baaahs/light-server-infrastructure?utm_source=badge)

This project contains the necessary roles to take commodity off-the-shelf hardware, listed below, and create a working BAAAHS light control server. The light control server uses its internal wifi adapter to connect to pre-determined networks, creates a `baaahs` network for offline administration/OSC functionality/etc, runs olad, the BAAAHS python show server, and sound feed back software. The server is principally responsible for controlling the ~150 panels that makeup the deployed sheep.

For a full overview of the BAAAHS lights infrastructure and where the server piece fits in, run through [this deck](http://slides.com/joshdurbin/baaahs-lights/). 

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
- [Kinobo - USB 2.0 Mini Microphone "Makio" Mic](https://www.amazon.com/gp/product/B00IR8R7WQ)

# SERVER BUILD
To build a server do the following:

- Prepare your SD Card...
  - Insert the SanDisk SD card in your machine and ensure it's formatted FAT32 and blank.
  - Download the latest [NOOBS Lite](https://downloads.raspberrypi.org/NOOBS_lite_latest) image.
  - Unzip the contents of download onto the newly formatted SanDisk SD Card.
  - Eject the card and set it aside.

- Assemble your equipment...
  - Affix the heat sinks -- the flat heat sink is applied to the underside chip, the larger two heat sinks are applied to the chips on the topside of the PI.
  - The UPS PIco HAT sits on top of the RPI GPIO header PINS.
  - Insert the SD card into the PI. (Note: The PI 3 has a push->pull, not push-push SD card slot)
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
    
You should now be able to SSH into the PI: `ssh pi@baaahslights.local`. While you can SSH to the PI via password authentication, Ansible prefers not to and
  will complain if you try to. To avoid this, copy your public key to the PI to complete setup either manually or using `ssh-copy-id pi@baaahslights.local` (defaults to default public key).   
 
# EXECUTE PLAYBOOK
First, install [ansible](http://docs.ansible.com/ansible/index.html) via brew; `brew install ansible` or via a binary/installer of your choice.

Next, execute this playbook against the `baaahslights.local` server, using a vault password obtained by contacting [Josh Durbin](https://github.com/joshdurbin).

Ex: `./build_baaahs_lights_server.sh`
 
# ADMINISTRATION OF THE SERVER
There are three pathways onto the Raspberry PI lights server...

1. via the RJ45 ethernet device on a pre-existing network (accessible via DHCP assigned address OR via manual assignment on the work 172.1.1.0/24 - RPI3 is at 172.1.1.1)
2. via the internal wifi adapter on a pre-configured network (accessible via DHCP assigned address)
3. via the wireless network the server creates, `baaahs`, with the WPA2 key `baaahs2017` (RPI3 is at 172.2.1.1)

There are two web-based interfaces available:

- [OLA Daemon/interface](http://baaahslights.local:9090/new/#/) at port `9090`
- [BAAAHS Light Server](http://baaahslights.local:9990/) at port `9990`
- [OSC Layout Server](http://baaahslights.local:9658/) at port `9658`
