echo ""
echo "-----SYSTEM'S CONFIGURATIONS-----"
echo ""
echo "Installing all applications..."

cat my_apps.txt | xargs -r sudo pacman -S --needed

echo ""

echo "[USER SPECIFIC CONFIGURATION]"
echo ""

printf "Configuring Hyprland... "

if test (mkdir -p ~/.config/hypr && cp config/hypr/* ~/.config/hypr)
    printf "OK\n"
else
    printf "UNSUCCESSFUL\n"
end

printf "Configuring QuickShell... "

if test (mkdir -p ~/.config/quickshell && cp config/quickshell/* ~/.config/quickshell)
    printf "OK\n"
else
    printf "UNSUCCESSFUL\n"
end

printf "Configuring Fish... "

if test (mkdir -p ~/.config/fish && cp config/fish/* ~/.config/fish)
    printf "OK\n"
else
    printf "UNSUCCESSFUL\n"
end

printf "Configuring btop... "

if test (mkdir -p ~/.config/btop && cp config/btop/* ~/.config/btop)
    printf "OK\n"
else
    printf "UNSUCCESSFUL\n"
end

printf "Configuring Kitty... "

if test (mkdir -p ~/.config/kitty && cp config/kitty/* ~/.config/kitty)
    printf "OK\n"
else
    printf "UNSUCCESSFUL\n"
end

printf "Configuring Rofi... "

if test (mkdir -p ~/.config/rofi && cp config/rofi/* ~/.config/rofi)
    printf "OK\n"
else
    printf "UNSUCCESSFUL\n"
end

printf "Configuring helpfull applications... "

if test (mkdir -p ~/.local/share/applications && cp local/share/applications/* ~/.local/share/applications)
    printf "OK\n"
else
    printf "UNSUCCESSFUL\n"
end

echo "Configuring SDDM..."

echo ""
echo "Installing yay for Sugar-Candy SDDM theme..."
echo ""

git clone https://aur.archlinux.org/yay-git.git
cd yay
if test (makepkg -si)
    echo ""
    echo "Installing yay : OK"
    echo ""

    cd ..
    rm -rf yay

    echo "Installing Sugar Candy SDDM theme..."

    yay -S sddm-theme-sugar-candy-git 

    echo ""
    echo "Installation of Sugar Candy SDDM theme completed"
    echo "Modifying theme.conf..."

    sudo cp usr/share/sddm/themes/Sugar-Candy/theme.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf

    echo "Modifying background..."

    sudo cp usr/share/sddm/themes/Sugar-Candy/Backgrounds/Orion-Pax.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds
else
    echo "Installing yay : UNSUCCESSFUL"
    echo "Default SDDM theme will be used"
    cd ..
    rm -rf yay
end

echo ""
echo "SDDM configured"

echo ""
echo "[BOOT CONFIGURATION]"
echo ""

echo ""
echo "Enabling SDDM at boot..."

systemctl enable sddm

echo "Enabling pipewire at boot..."

systemctl enable --user pipewire

echo "Enabling pipewire-pulse at boot..."

systemctl enable --user pipewire-pulse

echo "Enabling wireplumber at boot..."

systemctl enable --user wireplumber

read -p "Resarting computer ? (y/n) : " restart

if test "$restart" = y
    reboot
else
    echo "Installation completed"
end