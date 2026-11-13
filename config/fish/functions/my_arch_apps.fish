function my_arch_apps
     pacman -Qeq | grep -v -E "gtkmm3|open-vm-tools|sddm-theme-sugar-candy-git|xf86-input-vmmouse"
end
