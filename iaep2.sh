#!/bin/bash

function en_us2() {
    echo
    genfstab -U /mnt >> /mnt/etc/fstab
    #Setting the localtime
    chroot "/mnt"
    chroot "ln-sf /usr/share/zoneinfo/America/New_York /etc/localtime"
    chroot "hwclock --systohc"
    #nano /etc/locale.gen
    echo
    echo "============================================================="
    echo "Now enter the file /etc/locale.gen and uncomment the line 176"
    echo "(# en_US.UTF-8 UTF-8) remove the '#'."
    echo "Then press CTRL + O to save."
    echo "============================================================="
    echo "Wait 15sec to continue"
    sleep 15
    nano /etc/locale.gen
    localeLang
    locale-gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    localectl set-x11-keymap us
    #Hostame and passwd set
    echo
    echo "======================="
    echo "Enter the computer name"
    echo "======================="
    echo 
    read -p ":" hostname
    echo $hostname > /etc/hostname
    passwd
    #Username and passwd set
    echo
    echo "=================="
    echo "Enter the username"
    echo "=================="
    echo
    read -p ":" username
    useradd -m -G wheel -s /bin/bash $username
    passwd $username
    #EDITOR=nano visudo
    echo
    echo "=========================================================="
    echo "Now enter the /etc/sudoers.tmp file and go to line 80."
    echo "Then add your username with the same root user attributes,"
    echo "example (username ALL = (ALL) ALL)."
    echo "=========================================================="
    echo "Wait 10sec to continue..."
    echo 
    sleep 10
    EDITOR=nano visudo
    #Grub installer
    pacman -S grub efibootmgr
    grub-install /dev$disk
    
}

en_us2