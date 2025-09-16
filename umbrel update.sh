#!/bin/bash

    sudo apt update
    sudo apt full-upgrade
    sudo apt clean
    sudo apt autoremove
    sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
    sudo find /etc/apt/sources.list.d -type f -exec sed -i 's/bookworm/trixie/g' {} \;
    sudo apt update
    sudo apt full-upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" --purge --auto-remove
   
echo "Update to Trixie successful"

 sudo reboot

