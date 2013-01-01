#!/bin/bash

# create a pulseaudio wiretap to mix two sources together in order to record them

pactl load-module module-null-sink sink_name=mywiretap
echo 'set-default-sink mywiretap' | pacmd
echo 'set-default-source alsa_output.usb-M-Audio_FastTrack_Pro-00-Pro.analog-stereo-a-output.monitor' | pacmd
pactl load-module module-loopback

# echo 'set-default-source alsa_input.usb-M-Audio_FastTrack_Pro-00-Pro.analog-stereo-a-input' | pacmd
# or
echo 'set-default-source alsa_input.pci-0000_00_1b.0.analog-stereo' | pacmd

pactl load-module module-loopback

echo 'set-default-source mywiretap.monitor' | pacmd
echo 'set-default-sink alsa_output.usb-M-Audio_FastTrack_Pro-00-Pro.analog-stereo-a-output' | pacmd