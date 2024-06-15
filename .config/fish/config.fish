if status is-interactive
    # Commands to run in interactive sessions can go here
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Removes fish intro prompt
set fish_greeting ""

# True-colour terminal
set -gx TERM xterm-256color

# Aliases
alias g git
# alias grep rg
alias vi nvim  
alias v nvim
command -qv nvim && alias vim nvim
alias hx helix

# Alias to clear swap if Linux refuses to
# clear RAM used
alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""

if type -q exa
    alias ls='exa --group-directories-first --icons'
    alias ll='ls -lh --git'
    alias la='ll -a'
    alias tree='ll --tree --level=2'
end
alias hwssh="ssh SV-21020142@112.137.129.139" #mk: duyhung123 alias lg="lazygit"
alias e="exit"
alias c="clear"
alias nf="neofetch"
alias update="sudo pacman -Syyu"
alias shutdown="poweroff"
alias kill="tmux kill-server"
alias cpu="sudo auto-cpufreq --stats"
alias up="uptime -p"
alias wifi="nmtui"
alias list="sudo pacman -Qe"
alias logout="hyprctl dispatch exit"
alias ..="cd .."
alias pause="systemctl suspend"
alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

# remember to yay -S swaylock-effects-git
alias lock="swaylock --clock --indicator --screenshots --effect-scale 0.4 --effect-vignette 0.2:0.5 --effect-blur 4x2 --datestr '%a %e.%m.%Y' --timestr '%k:%M'"

alias ol="tmux source-file ~/.config/tmux/tmux_light.conf"
alias od="tmux source-file ~/.config/tmux/tmux.conf"

# alias bigmoni="xrandr --output eDP --off"
alias bigmoni="xrandr --output HL-X11-0 --off"

alias sn="NVIM_APPNAME=SN nvim"
alias dn="NVIM_APPNAME=DN nvim"
alias as="NVIM_APPNAME=AstroNvim nvim"
alias nv="NVIM_APPNAME=NvChad nvim"
alias mini="NVIM_APPNAME=miniNvim nvim"

# alias lz="NVIM_APPNAME=LazyVim nvim"
# Set up Environmental Variables
set -gx EDITOR as
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH node_modules/.bin $PATH
set -gx XDG_CONFIG_HOME $HOME/.config/

zoxide init fish | source

starship init fish | source
# cowsay "do something human"
begin
  nvm use 20
end &> /dev/null
