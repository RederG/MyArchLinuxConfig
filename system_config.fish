echo ""
echo "-----SYSTEM'S CONFIGURATIONS-----"
echo ""
echo "Installing all applications..."

echo ""
echo "Installing yay's build dependencies"
echo ""

sudo pacman -S --needed base-devel

echo ""
echo "Installing yay..."
echo ""

set -l CURRENT_DIRECTORY (pwd)

cd ..
mkdir Directory
cd Directory
git clone https://aur.archlinux.org/yay.git
cd yay

makepkg -si

if test $status
    echo ""
    echo "Installing yay : OK"
    echo ""

    cd ..
    rm -rf yay

    cd ..
    rm -rf Directory
    cd $CURRENT_DIRECTORY

    echo ""
    echo "Installing other applications"
    echo ""

    read -P "Do you want all applications (if you say 'n' or 'N', only the minimal setup will be installed) ? (Y/n) : " -l response
    if test "$response" = "" || test "$response" = y || test "$response" = Y
        cat my_apps.txt | xargs -r echo yay -S --needed > all_apps_to_install.fish
    else
        cat minimal_apps.txt | xargs -r echo yay -S --needed > all_apps_to_install.fish
    end

    fish all_apps_to_install.fish

    echo ""
    echo "[USER SPECIFIC CONFIGURATION]"
    echo ""

    printf "Configuring Hyprland... "

    if cp -r config/hypr ~/.config 2>/dev/null
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring QuickShell... "

    if cp -r config/quickshell/ ~/.config/ 2>/dev/null
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring Fish... "

    if cp -r config/fish ~/.config 2>/dev/null
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring btop... "

    if cp -r config/btop ~/.config 2>/dev/null
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring Kitty... "

    if cp -r config/kitty ~/.config/ 2>/dev/null
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring Rofi... "

    if cp -r config/rofi ~/.config 2>/dev/null
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring Clipcat... "

    if cp -r config/clipcat ~/.config 2>/dev/null
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring Hyprland's awww background... "

    if cp -r local/share/backgrounds ~/.local/share/backgrounds
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring icons... "

    if cp -r local/share/icons ~/.local/share
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring helpfull applications... "

    if cp -r local/share/applications ~/.local/share
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    echo "Configuring SDDM..."

    echo ""
    echo "Installing Sugar Candy SDDM theme..."

    yay -S sddm-theme-sugar-candy-git

    if test $status 
        echo ""
        echo "Installation of Sugar Candy SDDM theme completed"
        echo "Modifying theme.conf..."

        sudo cp usr/share/sddm/themes/Sugar-Candy/theme.conf /usr/share/sddm/themes/Sugar-Candy/theme.conf

        echo "Modifying background..."

        sudo cp usr/share/sddm/themes/Sugar-Candy/Backgrounds/Orion-Pax.jpg /usr/share/sddm/themes/Sugar-Candy/Backgrounds

        echo ""
        echo "Setting up SDDM's current theme and keyboard settings..."

        sudo cp -r etc/sddm.conf.d /etc
        sudo localectl set-x11-keymap fr

        echo ""
        echo "SDDM configured"
    else
        echo "Installation of the Sugar Candy SDDM theme unsuccessfull"
        echo "Default SDDM theme will be used"
    end

    echo ""
    echo "Setting up pacman..."
    sudo cp etc/pacman.conf /etc/pacman.conf

    echo ""
    echo "[BOOT CONFIGURATION]"
    echo ""

    echo ""
    echo "Enabling SDDM at boot..."

    sudo systemctl enable sddm 

    echo ""
    echo "Enabling reflector.timer at boot..."
    
    sudo systemctl enable reflector.timer

    echo ""
    echo "Enabling pipewire at boot..."

    systemctl enable --user pipewire

    echo ""
    echo "Enabling pipewire-pulse at boot..."

    systemctl enable --user pipewire-pulse

    echo ""
    echo "Enabling wireplumber at boot..."

    systemctl enable --user wireplumber

    echo ""
    echo "Installation complete"

    read -P "Do you want to reboot ? (Y/n) : " -l response
    if test "$response" = "" || test "$response" = y || test "$response" = Y
        reboot
    else
        echo "So good byeeee !"
        echo "Enjoy your system !"
    end
else
    echo "Installing yay : UNSUCCESSFUL"
    echo "Aborting installation"
end