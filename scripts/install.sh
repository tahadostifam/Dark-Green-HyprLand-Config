#!/usr/bin/env bash

if [ "$(command -v jp2a)" ]; then
    jp2a ./images/shalgam.png
fi

# Welcome message
echo -e "Welcome to HyprLand! This script will install the Shalgam-Hypr-DE."
echo -e "\033[33mNOTICE: This package is new born and only supports [ArchLinux, NixOS] at this moment.\nWe will add more distro supports soon! \033[0m"
echo -e "\n"
echo -e "\033[35mAre you sure you want to install Shalgam on your Linux distro? [Y, n]\033[0m"

read VERIFY_INSTALLATION

if [[ -z "$VERIFY_INSTALLATION" || "$VERIFY_INSTALLATION" =~ ^[Yy]$ ]]; then
    if [ -f /etc/apt/sources.list ]; then
    echo "Not implemented yet!"
    exit 0
    # Check for RedHat/CentOS/Fedora
    elif [ -f /etc/redhat-release ] || [ -f /etc/centos-release ] || [ -f /etc/fedora-release ]; then
    echo "Not implemented yet!"
    exit 0
    # Check for Arch Linux
    elif [ -f /etc/arch-release ]; then
    bash ./scripts/install_dependencies_arch_linux.sh
    else
    echo -e "Unable to determine distribution name!"
    echo -e "Please run install script manually."
    fi

    echo -e "\033[33mNOTICE: Some configuration files may be overwritten by script. \033[0m"    
    echo -e "\033[33m        List: bar, btop, dunst, hypr, kitty, wofi \033[0m"    

    # Copy config files to local system
    sudo cp -r ./configs/* ~/.config

    chmod +x ~/.config/hypr/scripts/tools/*
    chmod +x ~/.config/hypr/scripts/*
    chmod +x ~/.config/hypr/*

    echo -e "\033[32m\nShalgam installed successfully!🌵 \033[0m"
fi

