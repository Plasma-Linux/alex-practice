#!/bin/sh

#########################################
#                                       #
# Welcome to final-process.sh!          #
# Now let's finish building the system! #
# We will now run finalprocess.sh.      #
# Please wait a moment.                 #
#                                       #
#########################################

#Install Ubuntu-Desktop
apt install -y \
plymouth-theme-ubuntu-logo \
ubuntu-gnome-desktop \
ubuntu-gnome-wallpapers

#Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
rm microsoft.gpg
apt update
apt install -y code

#Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt update
apt install -y google-chrome-stable

#Delete packages
apt purge -y \
gnome-mahjongg \
gnome-mines \
gnome-sudoku \
aisleriot \
hitori

exit0
