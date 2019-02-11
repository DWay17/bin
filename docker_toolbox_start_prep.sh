#!/bin/sh
echo ; set | grep -E "DOCKER|VBOX"

echo ; echo $PATH | tr ':' '\n' | grep -Ei 'DOCKER|VBOX'
#export DOCKER_TOOLBOX_INSTALL_PATH='C:\Program Files\Docker Toolbox'
export PATH="/c/Program Files/Docker Toolbox:/c/Program Files/Oracle/VirtualBox":$PATH
export PATH="/c/Users/t.richter/AppData/Local/Atlassian/SourceTree/git_local/usr/bin":$PATH

echo ; echo $PATH | tr ':' '\n' | grep -Ei 'DOCKER|VBOX|VirtualBox'

#export VBOXMANAGE='C:\Program Files\Oracle\VirtualBox\/VBoxManage.exe'
#export VBOX_MSI_INSTALL_PATH='C:\Program Files\Oracle\VirtualBox\'
#export VBOX_MSI_INSTALL_PATH=C:\Program Files\Oracle\VirtualBox\
#export VBOX_MSI_INSTALL_PATH="C:\Program Files\Oracle\VirtualBox\"
#echo ; set | grep -E "DOCKER|VBOX"

#export VBOX_MSI_INSTALL_PATH=`cygpath -u ${VBOX_MSI_INSTALL_PATH}`
#unset VBOX_MSI_INSTALL_PATH

#echo ; set | grep -E "DOCKER|VBOX"
