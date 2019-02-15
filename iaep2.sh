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

function en_us2() {
    echo
    genfstab -U /mnt >> /mnt/etc/fstab
    #Setting the localtime
    arch-chroot "/mnt"
    arch-chroot "ln-sf /usr/share/zoneinfo/America/New_York /etc/localtime"
    arch-chroot "hwclock --systohc"
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
    grub-mkconfig -o /boot/grub/grub.cfg
    #Installing packages that are essential for system operation.
    MenuGi

}

#xfce4 function GI MENU
function xfce4() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics xfce4
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

#lxde function GI MENU
function lxde() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics lxde
        systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

#kde function GI MENU
function plasma() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics plasma
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

#gnome function GI MENU
function gnome() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics gnome
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

#cinnamon function GI MENU
function cinnamon() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics cinnamon
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
}

function mate() {
    echo "Installing the packages..."
    pacman -S archlinux-keyring bash-completion dosfstools efibootmgr f2fs-tools firefox gamin gparted grub gvfs gvfs-mtp htop intel-ucode lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings networkmanager network-manager-applet ntfs-3g p7zip pulseaudio-alsa qt5ct qt5-styleplugins tlp ttf-dejavu ttf-liberation unrar vlc xdg-user-dirs xf86-input-libinput xf86-video-intel xorg-server xorg-xinit linux-headers gnome-disk-utility reflector xf86-input-synaptics mate
    systemctl enable NetworkManager
    systemctl enable lightdm
    systemctl enable tlp
    exit
    umount -a
    reboot
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

en_us2