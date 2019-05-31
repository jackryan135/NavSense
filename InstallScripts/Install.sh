#!/bin/bash

# General
sudo apt-get update
sudo apt-get upgrade
sudo rpi-update

# TFMini
mv /boot/config.txt temp.txt
cat temp.txt config_edits.txt > config.txt
mv config.txt /boot/config.txt
rm temp.txt

# Google Coral Accelerator
sudo apt-get install feh
cd ~/
wget https://dl.google.com/coral/edgetpu_api/edgetpu_api_latest.tar.gz -O edgetpu_api.tar.gz --trust-server-names
mv edgetpu_api* edgetpu_api.tar.gz
tar xzf edgetpu_api.tar.gz
rm edgetpu_api.tar.gz
cd edgetpu_api
bash ./install.sh

# Start program on reboot
cd ~/NavSense/InstallScripts/
mv /etc/rc.local temp.txt
cat temp.txt startup.txt > rc.local
mv rc.local /etc/rc.local
rm temp.txt

# pyttsx
pip3 install pyttsx3 
sudo apt-get install espeak


sudo reboot
