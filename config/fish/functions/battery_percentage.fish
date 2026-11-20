function battery_percentage
    acpi -b | grep -o "[0-9]\+%"
end
