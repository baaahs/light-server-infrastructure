
There are two services concerning lights; 'olad' and 'lights'. 'lights' is the python codebase, service, custom to
BAAAHS that runs light shows and the OSC service interface. 'olad' is the Open Lighting Alliance daemon which 'lights'
interacts with to send DMX commands over the USB <--> DMX adapter.

To view the status of one of these services:

  systemctl status <service}>

To stop/start one of these services:

  sudo systemctl stop <service>
  sudo systemctl start <service>

Note: Both services are set to automatically restart no matter what unless they are explicitly stopped. If a service
  crashes, if the service is shutdown via a web interface (and not the systemd interfaces), or faults for any other
  reason it will automatically restart. The 'olad' service is a dependency for the 'lights' service.

  **** If you use systemd to stop a service, it will not auto-restart. ****

To view system logs:

  sudo journalctl --system --follow --lines=100

If you wish to make the sheep simply white you must shutdown the 'lights' service, then go into the olad control
  interface, select the default/single universe, and select the illuminated light icon on the faders tab. This broadcasts
  a message across all channels of 255, full brightness, for white.

If the fader or DMX control page are open on a tablet, phone, or laptop and the 'lights' server is also running, the sheep
  might experience flickering. This is because the ola interface is broadcasting a message like the aforementioned "all white"
  and the python-based 'lights' server is instructing whatever the running show specifies, leading to a flickr affect.
  In this case, close the ola interface windows.

To run the DMX setup script, first become the baaahs user via 'sudo su baaahs', change to the baaahs user's lights
  installation directory via 'cd ~/lights', finally run the script via './panel_setup.py'. The sheep should turn entirely
  white and should illumimate each target panel red as it steps through all available panels.