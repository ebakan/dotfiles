[[ -e "$HOME/.secrets" ]] && source "$HOME/.secrets"
export PATH="/usr/local/bin:$PATH"
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
alias python2="/usr/local//bin/python"
#source "/usr/local/bin/virtualenvwrapper.sh"

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(
  brew
  bundler
  gem
  git
  git-flow-completion
  # heroku
  history-substring-search
  node
  npm
  osx
  postgres
  python
  ruby
  rvm
  tmux
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# VARS
export CLICOLOR=1
LC_ALL=C export EDITOR=vim
export VISUAL=vim
export TERM=xterm-256color
export fpath=(~/.zsh/completion $fpath)

# zsh options
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
PROMPT='%B%~%b:%#'
RPROMPT='(%* - %W)'
setopt alwaystoend
setopt appendhistory
setopt autocd
setopt autopushd
setopt autonamedirs
setopt cdablevars
setopt correct
setopt completeinword
setopt extendedglob
setopt extendedhistory
setopt interactivecomments
setopt histignoredups
setopt histignorespace
setopt listpacked
setopt listtypes
setopt longlistjobs
setopt noalwayslastprompt
setopt noautoremoveslash
setopt sharehistory
autoload -U compinit
compinit
autoload -U promptinit
autoload -U zmv
promptinit
#prompt fire

# Aliases
alias c="cd"
alias ding="afplay /System/Library/Sounds/Glass.aiff"
alias j="jobs"
alias l="ls"
alias ll="ls -l"
alias ls="ls -Gh"
alias lsl="ls -l"
alias lsa="ls -a"
alias mtr="/usr/local/sbin/mtr"
alias pyserver="python -m \"SimpleHTTPServer\"";
alias spoof="sudo ifconfig en0 down && sudo ifconfig en0 up && sudo ifconfig en0 ether e1:e2:e3:e4:e5:e7"
alias unspoof="sudo ifconfig en0 down && sudo ifconfig en0 up && sudo ifconfig en0 ether 00:25:4b:d3:83:e2"
alias redock="killall Dock"
alias remake="make clean && make"
alias forgit="vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh"
alias delete-merged="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d"
alias master='git checkout master'
alias f="fg"
alias zcp='zmv -C'
alias zln='zmv -L'
alias reset-camera='killall VDCAssistant'
alias purge-rabbit="rabbitmqadmin list queues|awk 'NR>3{print \$2}'|xargs -I qname rabbitmqadmin delete queue name=qname"
alias s="say -v"
alias stgo="stg goto"

function nuke_schema {
  rm config/db_schema_cache.bin &&
  rm db/schema_cache.dump &&
  dump_schema_cache=1 disable_ar_schema_cache=1 bundle exec rake db:build_postgres_schema_cache --trace &&
  disable_ar_schema=1 disable_ar_schema_cache=1 bundle exec rake db:migrate
}

#functions
function cdl {
    cd $1;
    ls;
}

function mkcd {
    mkdir $1;
    cd $1;
}

function search
{
    grep -rn "$1" *
}

function vimall
{
    if [ $# -ge 1 ] ; then
	d=$1
    else
	d=`pwd`
    fi
#for i in $(ls $d | grep ".*\.\(h\|cpp\)$"); do vim $(echo $d/$i | sed "s/\/\//\//"); done;
    for i in $(ls $d); do vim $(echo $d/$i | sed "s/\/\//\//"); done;
}

function loop
{
    while true; do
        clear
        $*
        sleep 1
    done
}

# Man coloring
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# RVM
# PATH
export PATH="/usr/local/bin/:${PATH}"
export PATH="$PATH:/usr/local/depot_tools/"
export PATH="$HOME/.yvm/shim":$PATH
export PATH="/usr/local/opt/llvm/bin:$PATH"

export PATH="$PATH:$GEM_HOME/bin/"
export XDG_CONFIG_HOME="$HOME/.config"

# Powerline configuration
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi

#--------------------------------------------------------------------#
# Global Configuration Variables                                     #
#--------------------------------------------------------------------#

# Color to use when highlighting suggestion
# Uses format of `region_highlight`
# More info: http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Widgets
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

# Prefix to use when saving original versions of bound widgets
export ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX=autosuggest-orig-

#export ZSH_AUTOSUGGEST_STRATEGY=history
# Widgets that clear the suggestion
export ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
	history-search-forward
	history-search-backward
	history-beginning-search-forward
	history-beginning-search-backward
	history-substring-search-up
	history-substring-search-down
	up-line-or-history
	down-line-or-history
	accept-line
)

# Widgets that accept the entire suggestion
export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
	forward-char
	end-of-line
	vi-forward-char
	vi-end-of-line
)

# Widgets that accept the entire suggestion and execute it
export ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=(
)

# Widgets that accept the suggestion as far as the cursor moves
export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
	forward-word
	vi-forward-word
	vi-forward-word-end
	vi-forward-blank-word
	vi-forward-blank-word-end
)

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

#source ~/.zsh/zsh-apple-touchbar/zsh-apple-touchbar.zsh

export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

# https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
#if [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
#  export NVM_DIR="$HOME/.nvm"
#  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
#  declare -a __node_commands=('nvm' 'node' 'npm' 'gulp' 'grunt' 'webpack')
#  function __init_nvm() {
#    for i in "${__node_commands[@]}"; do unalias $i; done
#    . "/usr/local/opt/nvm/nvm.sh"
#    unset __node_commands
#    unset -f __init_nvm
#  }
#  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
#fi
#
#if [ -s "$HOME/.yvm/yvm.sh" ]; then
#  export YVM_DIR="$HOME/.yvm"
#  declare -a __yarn_commands=('yvm' 'yarn')
#  function __init_yvm() {
#    type "__init_nvm" > /dev/null && __init_nvm
#    for i in "${__yarn_commands[@]}"; do unalias $i; done
#    . "$YVM_DIR/yvm.sh"
#    unset __yarn_commands
#    unset -f __init_yvm
#  }
#  for i in "${__yarn_commands[@]}"; do alias $i='__init_yvm && '$i; done
#fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
#
# export YVM_DIR=/Users/ebakan/.yvm
# [ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
source /etc/profile.d/rvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ebakan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ebakan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ebakan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ebakan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

