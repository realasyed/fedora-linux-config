#!/bin/bash

echo "Attempting to add folders..."

mkdir GitHub -v
mkdir Programs -v
cd Programs -v
mkdir Python -v
mkdir Bash -v
cd ~ -v

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
