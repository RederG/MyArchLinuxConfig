function i_have_battery
    if ls /sys/class/power_supply/ | grep BAT > /dev/null
        echo yes
    else
        echo no
    end
end
