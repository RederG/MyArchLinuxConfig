function pacman_installer
    set PACKAGES_NAME $(pacman -Slq | fzf -m --preview 'pacman -Si {}')
    printf "Installing "
    printf "$PACKAGES_NAME"
    printf "...\n\n"
    sudo pacman -S $PACKAGES_NAME
    echo
    echo FINISHED !
    echo
    while sleep 1
    end
end
