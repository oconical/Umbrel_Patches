#!/bin/bash

echo -e "Set New Password /n"
passwd umbrel
sudo passwd root

sudo -i
apt update
apt upgrade

apt install net-tools
apt install ufw

ufw allow 80
ufw allow 443
ufw deny 7777
ufw deny 13962
ufw deny 14178
ufw deny from  141.94.45.159 to any  
ufw deny from  23.128.248.0/24  to any  
ufw deny from  91.123.158.251 to any  
cd /etc/ssh
rm *_key
rm *_key.pub
ssh-keygen -A
echo "export LS_OPIONS='--color=auto'" | tee -a /root/.bashrc
echo "eval '$(dircolors)'" | tee -a /root/.bashrc
echo "alias ls=' ls $LS_OPTIONS'" | tee -a /root/.bashrc
echo "alias ll=' ls $LS_OPTIONS -al'" | tee -a /root/.bashrc