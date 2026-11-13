if status is-interactive
	# fastfetch
end

function blank_line --on-event fish_postexec
	test "$argv[1]" = clear; or test "$argv[1]" = cls; or echo
end

function clear
	printf "\e[H\e[2J\e[3J"
end

function cls
	clear
end
