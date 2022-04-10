#!/bin/bash



#This section adds the following lines of code to the .bashrc file.
echo '#Custom Aliases'
echo 'alias anime="cd GitHub/ && cd ani-cli/ && ./ani-cli"'
echo 'alias nclear="clear && neofetch"'
echo 'alias update="cd Programs/Bash/ && ./packageupdater.sh"'
echo 'alias upgrade="cd Programs/Bash/ && ./packageupdater.sh"'
echo 'alias lll="ls -l -a"'
echo 'alias llll="ls -l -a -Z -R"'
echo '#Custom BASH Prompt'
echo 'PS1="\u@\w> "'

#This realizes the changes above.
source .bashrc
