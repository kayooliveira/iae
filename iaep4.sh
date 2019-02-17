#!/bin/bash
clear
#Function Finish
function MenuFinish() {
    echo 
    echo "=========================================="
    echo "          Installation Finished           "
    echo -e "  After exit, write \033[01;32mumount -a \033[01;37mand \033[01;32mreboot \033[01;37m"
    echo "=========================================="
    echo "Wait 10sec to continue..."
    echo 
    sleep 10
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
}
MenuFinish
