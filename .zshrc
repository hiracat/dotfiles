# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/forest/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
eval "$(starship init zsh)"

export PATH=$PATH:/home/forest/.spicetify
alias nv='nvim'
alias ls='ls --color=auto'
source ~/vulkan/1.3.250.1/setup-env.sh
clear
neofetch
