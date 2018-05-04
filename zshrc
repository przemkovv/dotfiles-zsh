# [ -z "$TMUX" ] && export TERM=xterm-256color
#if [ "$TMUX" == "" ]; then tmux; fi
#
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(fzf-functions docker history-substring-search vi-mode tmux common-aliases colorize git git-extras git-flow-avh gitignore pip ruby sibling-cd dirpersist pass vagrant zsh-syntax-highlighting)
#plugins=(docker history-substring-search vi-mode tmux common-aliases git svn colorize git-flow git-remote-branch gitfast gitignore pip ruby sibling-cd dirpersist pass vagrant)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/node_modules/.bin:$HOME/.cabal/bin:$HOME/.gem/ruby/2.1.0/bin:$HOME/.local/bin:/home/przemkovv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH="/usr/lib/ccache/bin/:$PATH"

# history:
setopt inc_append_history    # append history list to the history file (important for multiple parallel zsh sessions!)
setopt share_history        # import new commands from the history file also in other zsh-session
setopt extended_history     # save each commands beginning timestamp and the duration to the history file
setopt hist_ignore_all_dups # If a new command line being added to the history list duplicates an older one, the older command is removed from the list
setopt hist_ignore_space    # remove command lines from the history list when the first character on the line is a space

#HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000 # useful for setopt append_history


setopt extendedglob



setopt auto_cd
cdpath=($HOME/projects $HOME/projects/carmnet/src)
#autoload -U compinit; compinit
setopt COMPLETE_IN_WORD
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#zmodload -i zsh/complist
zstyle ':completion:*' menu select=1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
bindkey -M menuselect '^@' accept-and-infer-next-history
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'

# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

alias -s tex=nvim
alias -s pdf=zathura
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias pbcopy='xsel --primary --input'
alias pbpaste='xsel --primary --output'
alias cpwd='pwd|xargs echo -n|pbcopy'
alias porn=' mpv http://pornhub.com/random'

alias vim='nvim -w ~/.vimlog "$@"'
alias vs='vim --servername"VIM"'
alias vo='vim --servername"VIM" --remote-silent'

alias o='xdg-open'

alias agenda='gcalcli agenda'
alias week='gcalcli calw'
alias month='gcalcli calm'

alias vp='/usr/share/visual-paradigm-community/bin/Visual_Paradigm_Fixed'

alias gdb='gdb -q -tui'
alias ip='ip -c'
alias watch='watch --color'

alias fd='find . -type d -iname'
alias ff='find . -type f -iname'

export TERMINAL=termite
export BROWSER=firefox
export EDITOR="nvim"
bindkey -v 
# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^Y' yank
#

# Make deleting past last insert possible
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^w' backward-kill-word
#bindkey -M viins 'jk' vi-cmd-mode

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

stty ixany
stty ixoff -ixon

# 10ms for key sequences
KEYTIMEOUT=1

eval `dircolors ~/.dircolors`
export MC_SKIN=/usr/share/mc/skins/solarized.ini

function edit_all_sources() {
    $EDITOR $1/**/*.(cpp|h|hpp|java)
}

#setxkbmap -option ctrl:nocaps
if ! [ -x "$(command -v archey3)" ]; then
  neofetch
else
  archey3
fi
#export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

export PWD_LENGTH=20



#export DOCKER_HOST=localhost:2375

export FZF_CTRL_R_OPTS=--tiebreak=begin,index
export FZF_CTRL_T_OPTS=--bind=alt-a:select-all,alt-d:deselect-all

export CC=clang
export CXX=clang++
# export CC=gcc
# export CXX=g++
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export XZ_OPT=-T0

export GPG_TTY=$(tty)

export HUNTER_ROOT=~/dev/hunter
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

