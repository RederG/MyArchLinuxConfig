function battery_charge_state
    acpi -b | grep -o "[Aa-Zz]\+, [0-9]\+%" | grep -o "[Aa-Zz]\+"
end
