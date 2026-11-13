function system_state_changer
    set SYS_STATE $(printf "Shutdown\nReboot\n" | rofi -i -dmenu -p "System's state: " -theme "~/.config/rofi/themes/rounded-blue-dark.rasi")
    if test "$SYS_STATE" = Shutdown
        shutdown now
    else if test "$SYS_STATE" = Reboot
        reboot
    end
end
