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

echo "Configuring default shell to fish..."
echo ""
chsh -s /bin/fish

fish system_config.fish