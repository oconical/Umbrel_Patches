#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install -y xorg openbox chromium lightdm
sudo useradd -m kiosk
sudo sed -i '/#autologin-user=/c\autologin-user=kiosk' /etc/lightdm/lightdm.conf 
sudo sed -i '/#user-session=/c\user-session=openbox' /etc/lightdm/lightdm.conf 

sudo mkdir -p /home/kiosk/.config/openbox
sudo printf "chromium --kiosk http://umbrel.local" > /home/kiosk/.config/openbox/autostart

sudo reboot
