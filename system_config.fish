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

    sleep 2

    cat my_apps.txt | xargs -r echo yay -S --needed > all_apps_to_install.fish

    fish all_apps_to_install.fish

    echo ""
    echo "[USER SPECIFIC CONFIGURATION]"
    echo ""

    printf "Configuring Hyprland... "

    if test (cp -r config/hypr ~/.config 2>/dev/null)
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring QuickShell... "

    if test (cp -r config/quickshell/ ~/.config/ 2>/dev/null)
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring Fish... "

    if test (cp -r config/fish ~/.config 2>/dev/null)
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring btop... "

    if test (cp -r config/btop ~/.config 2>/dev/null)
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring Kitty... "

    if test (cp -r config/kitty ~/.config/ 2>/dev/null)
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring Rofi... "

    if test (cp -r config/rofi ~/.config 2>/dev/null)
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    printf "Configuring helpfull applications... "

    if test (cp -r local/share/applications ~/.local/share)
        printf "OK\n"
    else
        printf "UNSUCCESSFULL\n"
    end

    echo "Configuring SDDM..."

    echo ""
    echo "Installing yay for Sugar-Candy SDDM theme..."
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
        echo "SDDM configured"
    else
        echo "Installation of the Sugar Candy SDDM theme unsuccessfull"
        echo "Default SDDM theme will be used"
    end

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
end