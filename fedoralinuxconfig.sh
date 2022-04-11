#!/bin/bash

#This moves the script to the home directory.
echo "Attempting to move script to home directory..."
mv fedoralinuxconfig.sh ~

#This updates the system.
echo "Attempting to update system..."
sudo dnf update -v
sudo dnf autoremove -v

#This adds extra repos.
echo "Attempting to add extra repos..."
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#ADD OPEN RAZER AND MAYBE YOUR OWN REPO
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/hardware:razer/Fedora_35/hardware:razer.repo

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
sudo dnf install neofetch -v

echo "Attempting to download GitHub programs..."

git clone https://github.com/pystardust/ani-cli
sudo chmod +x ani-cli -v
mv ani-cli/ GitHub/ -v

#ADD PACKAGE UPDATER

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

#This gives the user to add more software
echo "Would you like to install extra (gaming related) software?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) echo "Attempting to install extra software..." && sudo dnf install steam && sudo dnf install discord && sudo dnf install kernel-devel && sudo dnf install openrazer-meta && sudo dnf install polychromatic;;
		No ) echo "Extra software will not be installed." && exit;;
	esac
done

#This realizes the changes above.
source .bashrc -v
sudo dnf autoremove -v
sudo dnf update -v

#Thjs gives the user the option to reboot.
echo "Would you like to reboot now?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) echo "Attempting to reboot..." && sudo reboot now;;
		No ) echo "Your system will not reboot." && exit -v;;
	esac
done
