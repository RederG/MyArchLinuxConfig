function pacman_remover
    set PACKAGES_TO_REMOVE $(pacman -Qq | fzf -m --preview 'pacman -Qi {}')
    printf "Removing "
    printf "$PACKAGES_TO_REMOVE"
    printf "...\n\n"
    sudo pacman -Rs $PACKAGES_TO_REMOVE
    echo
    echo FINISHED !
    echo
    while sleep 1
    end
end
