#!/bin/bash

#Notes: Ask if the user has put the .sh file in their directory or maybe
#move it with mv? You could also make another script that does that.

#This moves the script to the home directory.
mv fedoralinuxconfig.sh ~

echo "Note: This script requires an internet connection to properly function."

#This updates the system.

sudo dnf update -v
sudo dnf autoremove -v

#This adds extra repos.

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#This adds my folders.
echo "Attempting to add folders..."

mkdir GitHub -v
cd GitHub -v
mkdir MyProjects -v
cd ~ -v
mkdir Programs -v
cd Programs -v
mkdir Python -v
mkdir Bash -v
cd ~ -v

#This downloads my programs.
echo "Attempting to download programs..."

sudo dnf install vim -v
sudo dnf install gnome-tweaks -v
sudo dnf install gparted -v
sudo dnf install mpv -v
sudo dnf install ffmpeg -v
sudo dnf install python3 -v
sudo dnf install python2 -v

echo "Attempting to download GitHub programs..."

git clone https://github.com/pystardust/ani-cli
sudo chmod +x ani-cli -v
mv ani-cli/ GitHub/ -v

echo "Attempting to edit .bashrc..."

#This section adds the following lines of code to the .bashrc file.
echo '#Custom Aliases' >> /home/armaansyed/.bashrc -v
echo 'alias anime="cd GitHub/ && cd ani-cli/ && ./ani-cli"' >> /home/armaansyed/.bashrc -v
echo 'alias nclear="clear && neofetch"' >> /home/armaansyed/.bashrc -v
echo 'alias update="cd Programs/Bash/ && ./packageupdater.sh"' >> /home/armaansyed/.bashrc -v
echo 'alias upgrade="cd Programs/Bash/ && ./packageupdater.sh"' >> /home/armaansyed/.bashrc -v
echo 'alias lll="ls -l -a"' >> /home/armaansyed/.bashrc -v
echo 'alias llll="ls -l -a -Z -R"' >> /home/armaansyed/.bashrc -v

echo '#Custom BASH Prompt' >> /home/armaansyed/.bashrc -v
echo 'PS1="\u@\w> "' >> /home/armaansyed/.bashrc -v

#This realizes the changes above.
source .bashrc -v

sudo dnf autoremove -v
sudo dnf update -v
sudo reboot -v

