function battery_is_charging
    acpi -b | grep -o "[Aa-Zz]\+, [0-9]\+%" | grep -o "[Aa-Zz]\+"
end
