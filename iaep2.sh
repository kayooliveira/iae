#!/bin/bash

function iaep2() {
    echo
    genfstab -U /mnt >> /mnt/etc/fstab
    mv ./iae/iaep3.sh /
    mv ./iae/iaep4.sh /
    mv ./iae/iaep5.sh /

iaep2