function yay_system_updater
    printf "Updating the system...\n\n"
    yay -Syu
    echo
    echo FINISHED !
    echo
    while sleep 1
    end
end
