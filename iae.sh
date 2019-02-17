#!/bin/bash

#Welcome MENU
clear
function WelcomeMenu() {
    clear
    echo   "==========================================="
    echo -e "            WELCOME TO \033[01;32mIAE\033[01;37m  "
    echo   "      ARCH LINUX INSTALLATION SCRIPT      "
    echo   "-------------------------------------------"
    echo -e " Developed by \033[01;32mKayoOliveira\033[01;37m and \033[01;32mRobsonSilv4\033[01;37m"
    echo -e "\033[01;32m-------------------------------------------\033[01;37m"
    echo -e "   \033[01;32mhttps://github.com/kayooliveira1/iae\033[01;37m"
    echo -e "    \033[01;32mhttps://github.com/robsonsilv4/iae\033[01;37m"
    echo -e '\n'
    echo "_______________________"
    echo "Press ENTER to continue"
    read -p ":" input
    case $input in 
    *) MainMeu ;;
    esac
}

#Main MENU
function MainMeu() {
    clear
    echo -e "\033[01;34m==============================="
    echo -e "      \033[01;34mWHATS YOUR LANGUAGE?"
    echo ""
    echo -e "\033[01;31m[ 1 ] | ENGLISH\033[01;37m"
    echo -e "\033[01;31m[ 2 ] | PORTUGUÊS \033[01;33m(NOT WORKING)\033[01;37m"
    echo -e "\033[01;31m[ 3 ] | ESPAÑOL \033[01;33m(NOT WORKING)\033[01;37m"
    echo 
    read -p ":" input
    case $input in
    1) en_us ;;
    2) pt_br ;;
    3) es ;;
    *) MainMeu ;;
    esac
}

#Script in english language
function en_us() {
    #Load Keymap
    loadkeys us
    #clear
    clear
    #Installing REFLECTOR to improve download performance
    pacman -Syy
    pacman -S reflector
    reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
    #Partitioning the disk
    clear
    lsblk
    echo ""
    echo "Select the disk for partitioning, use the '/' before the disk ID, for example: / sda or / sdb or / sdc (...)."
    read -p ":" disk
    echo "Now, partition your disk, remember to create the partitions for the directories (/ boot, / home, swap and /)."
    sleep 5
    cfdisk /dev$disk
    clear
    #Formating partitions
    lsblk
    echo "Enter the partition ID that will be '/boot'. example: /sda1"
    echo
    read -p ":" boot
    echo
    echo "Enter the partition ID that will be 'swap'. example: /sda2"
    echo
    read -p ":" swap
    echo
    echo "Enter the partition ID that will be '/'. example: /sda3"
    echo
    read -p ":" root
    echo
    echo "Enter the partition ID that will be '/home' example: /sda4."
    echo
    read -p ":" home
    echo
    mkfs.vfat -F32 /dev$boot
    mkswap /dev$swap
    mkfs.ext4 /dev$root
    mkfs.ext4 /dev$home
    #Mounting partitions
    echo "Mounting partitions..."
    mount /dev$root /mnt
    mkdir -p /mnt/boot/efi
    mount /dev$boot /mnt/boot/efi
    swapon /dev$swap
    mkdir /mnt/home
    mount /dev$home /mnt/home
    #Move Part2 and 3 from / directory
    mv /iae/iaep2.sh /mnt
    mv /iae/iaep3.sh /mnt
    mv /iae/iaep4.sh /mnt
    #Function for install base and base-devel
    pacstrap /mnt base base-devel
    
}

#Script in portuguese language
function pt_br() {
    echo "Este idioma ainda não foi adicionado, aguarde futuras atualizações."
    echo "Aguarde 5seg para voltar ao menu"
    sleep 5
    MainMeu
}

#Script in spanish language
function es() {
    echo "Este idioma no se ha agregado, espere a futuras actualizaciones."
    echo "Espere 5seg para volver al menú"
    sleep 5
    MainMeu
}

WelcomeMenu