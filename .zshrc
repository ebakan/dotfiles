source "$HOME/.secrets"
source "/usr/local/bin/virtualenvwrapper.sh"

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git tmux gem osx rails ruby python heroku rvm postgres npm node brew bundler)
source $ZSH/oh-my-zsh.sh

# VARS
export CLICOLOR=1
LC_ALL=C
export EDITOR=vim
export VISUAL=vim
export TERM=xterm-256color
set history = 1000000
export SSL_CERT_FILE="/usr/local/etc/openssl/osx_cert.pem"
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
alias delete-merged="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"
alias master='git checkout master'
alias f="fg"
alias zcp='zmv -C'
alias zln='zmv -L'
alias reset-camera='killall VDCAssistant'
alias purge-rabbit="rabbitmqadmin list queues|awk 'NR>3{print \$2}'|xargs -I qname rabbitmqadmin delete queue name=qname"
alias s="say -v"
alias stgo="stg goto"

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
export PATH=/usr/local/bin/:${PATH}
export PATH="/usr/local/android-sdk-macosx/tools/:${PATH}"
export PATH="/usr/local/android-sdk-macosx/platform-tools/:${PATH}"
export PATH="/usr/local/google-cloud-sdk/bin/:${PATH}"
export PATH=~/.cabal/bin/:${PATH}
export PATH="$PATH:/usr/local/Cellar/rabbitmq/3.6.4/sbin/"
export PATH="$PATH:/usr/local/depot_tools/"
export PATH="$PATH:$HOME/.powerline/scripts/"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:$GEM_HOME/bin/"
