set fish_greeting                                 # Supresses fish's intro message

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# pacman and yay
alias update='sudo pacman -Syyuu'                 # update only standard pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Git
fish_git_prompt
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_use_informative_chars 1
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showuntrackedfiles 1
set __fish_git_prompt_showupstream auto
set __fish_git_prompt_showstashstate 1
set __fish_git_prompt_shorten_branch_len 10
set __fish_git_prompt_describe_style describe
set __fish_git_prompt_showcolorhints 1

# Neovim
alias nv="nvim -c 'startinsert'"

# Grub
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Flush pacman cache
alias flush-pacman-cache="sudo paccache -d && sudo paccache -r && sudo paccache -dvuk0 && sudo pacman -Sc"

# Flush uneeded package
alias flush-pacman-uneeded="sudo pacman -Qtdq | sudo pacman -Rns - || true && sudo pacman -Qdttq | sudo pacman -Rns - || true"

# Flush log files
alias flush-system="sudo du -h /var/log && sudo du -h /var && sudo journalctl --disk-usage && sudo journalctl --vacuum-size=0.1M && sudo journalctl --verify && sudo du -a | sort -n -f | head -n 20"

# Update pacman mirrorlist with reflector for better download speed
alias update-mirror="sudo reflector --verbose --country us -l 10 --sort rate --save /etc/pacman.d/mirrorlist"
