function fish_prompt
    set -l stat
    set -l last_status $status
    
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color --reset)
    end
    
    set -l git_branch
    
    if test (ls -a | grep -w ".git")
        set git_branch (set_color --reset)- (set_color yellow)git:(set_color --reset)(fish_git_prompt)
    end
    
    echo (set_color green)(prompt_hostname)(set_color --reset)"("(set_color blue)(prompt_pwd -D 255)(set_color --reset)")" $git_branch $stat
    set_color --reset
    string join "" (set_color cyan)$USER (set_color --reset)": "
end
