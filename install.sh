#!/bin/bash

echo "-----SYSTEM'S PRE-CONFIGURATION-----"

echo "Updating the system..."
echo ""

sudo pacman -Syu

echo ""
echo "Installing fish..."
echo ""

sudo pacman -S fish

echo ""

printf "Configuring default shell to fish... "
chsh -s /bin/fish

fish
fish system_config.fish