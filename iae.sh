#!/bin/bash

#Welcome MENU
clear
MenuBoasVindas() {
    clear
    echo   "__________________________________________"
    echo -e "            WELCOME TO \033[01;32mIAE\033[01;37m  "
    echo   "      ARCH LINUX INSTALLATION SCRIPT      "
    echo   "------------------------------------------"
    echo -e "Developed by \033[01;32mKayoOliveira\033[01;37m and \033[01;32mRobsonSilv4\033[01;37m"
    echo -e "\033[01;32m------------------------------------------\033[01;37m"
    echo -e "\033[01;32mhttps://github.com/kayooliveira1/iae\033[01;37m"
    echo -e "\033[01;32mhttps://github.com/robsonsilv4/iae\033[01;37m"
    echo -e '\n'
    echo "________________________"
    echo "Press ENTER to continue"
    read -p ":" input
    case $input in 
    *) MenuPrincipal ;;
    esac
}

#Main MENU
MenuPrincipal() {
    clear
    echo -e "\033[01;34m==============================="
    echo -e "      \033[01;34mWHATS YOUR LANGUAGE?"
    echo ""
    echo -e "\033[01;31m[ 1 ] | ENGLISH\033[01;37m"
    echo -e "\033[01;31m[ 3 ] | PORTUGUÊS \033[05;33m(NOT WORKING)\033[00;37m"
    echo -e "\033[01;31m[ 2 ] | ESPAÑOL \033[05;33m(NOT WORKING)\033[00;37m"
    echo 
    read -p ":" input
    case $input in
    1) en_us ;;
    2) pt_br ;;
    3) es ;;
    *) MenuPrincipal ;;
    esac
}

#Choose the GI MENU
    MenuGi() {
        clear
        echo "=================================================="
        echo "WHAT IS THE GRAPHIC INTERFACE YOU WISH TO INSTALL?"
        echo "=================================================="
        echo
        echo "[ 1 ] | XFCE"
        echo "[ 2 ] | LXDE"
        echo "[ 3 ] | KDE"
        echo "[ 4 ] | GNOME"
        echo "[ 5 ] | CINNAMON"
        echo "[ 6 ] | MATE"
        echo -e "[ 7 ] | UNITY \033[05;33m(NOT WORKING)\033[00;37m"
        echo
        read -p ":" gi
        case $gi in
        1) xfce4 ;;
        2) lxde ;;
        3) plasma ;;
        4) gnome ;;
        5) cinnamon ;;
        6) mate ;;
        7) MenuGi ;;
        *) MenuGi ;;
        esac
    }

#Script in english language
en_us() {
    #Load Keymap
    loadkeys us
    #Partitioning the disk
    lsblk
    echo ""
    echo "Select the disk for partitioning, use the '/' before the disk ID, for example: / sda or / sdb or / sdc (...)."
    read -p ":" disk
    echo "Now, partition your disk, remember to create the partitions for the directories (/ boot, / home, swap and /)."
    sleep 5
    cfdisk /dev$disk
    clear 
    #Formating partitions
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
    #Installing base and base-devel
    pacstrap /mnt 'base base-devel'
    genfstab -U /mnt >> /mnt/etc/fstab
    #Setting the localtime
    arch-chroot "/mnt"
    arch-chroot "ln-sf /usr/share/zoneinfo/Ameria/New_York /etc/localtime"
    arch-chroot "hwclock --systohc"
    #nano /etc/locale.gen
    echo "Now enter the file /etc/locale.gen and uncomment the line 176 (# en_US.UTF-8 UTF-8)."
    echo "Then press CTRL + O to save."
    echo "Wait 10sec to continue"
    sleep 10
    nano /etc/locale.gen
    locale-gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    localectl set-x11-keymap us
    #Hostame and passwd set
    echo "Enter the computer name"
    read -p ":" hostname
    echo $hostname > /etc/hostname
    passwd
    #Username and passwd set
    echo "Enter the username"
    read -p ":" username
    useradd -m -G wheel -s /bin/bash $username
    passwd $username
    #EDITOR=nano visudo
    echo "Now enter the /etc/sudoers.tmp file and go to line 80."
    echo "Then add your username with the same root user attributes, example (username ALL = (ALL) ALL)."
    echo "Wait 10sec to continue"
    EDITOR=nano visudo
    #Grub installer
    pacman -S grub efibootmgr
    grub-install /dev$disk
    grub-mkconfig -o /boot/grub/grub.cfg
    #Installing packages that are essential for system operation.
    MenuGi

}

#Script in portuguese language
pt_br() {
    MenuPrincipal
}

#Script in spanish language
es() {
    MenuPrincipal
}

#xfce4 function GI MENU
xfce4() {
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics xfce4
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

#lxde function GI MENU
lxde() {
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics lxde

}

#kde function GI MENU
plasma() {
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics plasma
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

#gnome function GI MENU
gnome() {
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics gnome
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

#cinnamon function GI MENU
cinnamon() {
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics cinnamon
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

mate() {
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics mate
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}
MenuBoasVindas