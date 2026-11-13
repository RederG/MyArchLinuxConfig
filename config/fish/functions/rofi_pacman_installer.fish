function rofi_pacman_installer
     set PACKAGE_TO_INSTALL $(pacman -Slq | rofi -dmenu -p "Install: " -theme "~/.config/rofi/themes/rounded-blue-dark.rasi")
     kitty echo Installing $PACKAGE_TO_INSTALL ... & sudo pacman -S $PACKAGE_TO_INSTALL
end
