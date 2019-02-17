#!/bin/bash

#Choose the GI | MENU
function MenuGi() {
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
        echo -e "[ 7 ] | UNITY \033[01;33m(NOT WORKING)\033[01;37m"
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

#xfce4 function GI MENU
function xfce4() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics xfce4
}

#lxde function GI MENU
function lxde() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics lxde
}

#kde function GI MENU
function plasma() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics plasma
}

#gnome function GI MENU
function gnome() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics gnome
}

#cinnamon function GI MENU
function cinnamon() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics cinnamon
}

function mate() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics mate
}

#Generating grub config
grub-mkconfig -o /boot/grub/grub.cfg
MenuGi