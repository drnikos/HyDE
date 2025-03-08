set -g fish_greeting

source ~/.config/fish/hyde_config.fish

if status is-interactive
    starship init fish | source

    # Display Pokemon
    pokego --no-title -r 1
end

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias vc='code'

alias inget="paru -S"
alias sysup="paru -Syu"
alias gc="git clone"
alias gp="git pull"


# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'


fish_add_path /home/wasp/.spicetify
alias progintro='luit -encoding ISO-8859-7 ssh -oHostKeyAlgorithms=+ssh-rsa <username>@novice.softlab.ntua.gr'
