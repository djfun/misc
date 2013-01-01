#!/bin/bash

# undo the stuff of setup_pulseaudio_recording.sh

LOOPBACK=$(pactl list | grep -B 1 "Name: module-loopback" | grep Modul | sed 's/[^0-9]//g' | head -n1)
pactl unload-module $LOOPBACK

LOOPBACK=$(pactl list | grep -B 1 "Name: module-loopback" | grep Modul | sed 's/[^0-9]//g' | head -n1)
pactl unload-module $LOOPBACK

MYWIRETAP=$(pactl list | grep -B 1 "Name: module-null-sink" | grep Modul | sed 's/[^0-9]//g')
pactl unload-module $MYWIRETAP

echo 'set-default-sink alsa_output.usb-M-Audio_FastTrack_Pro-00-Pro.analog-stereo-a-output' | pacmd