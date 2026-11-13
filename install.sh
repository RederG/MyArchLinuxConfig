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

FISH_IS_DEFAULT_SHELL="no"

printf "Configuring default shell to fish... "
if [ chsh -s /bin/fish ]
then
    printf "OK\n"
    FISH_IS_DEFAULT_SHELL="yes"
else
    printf "NO\n"
fi

if [ $FISH_IS_DEFAULT_SHELL = "no" ]
then
    echo "Installation terminated"
    echo "We cannot set fish to the default shell :("
else
    fish
    fish system_config.fish
fi