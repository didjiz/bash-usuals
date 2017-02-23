# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Autocorrects cd misspellings
shopt -s cdspell

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################################################

export EDITOR=vim # Editeur par défaut

# Git / terminal
export GIT_PS1_SHOWDIRTYSTATE=1 # Montre si modif de la copie locale (*) ou (+) pour l'index
export GIT_PS1_SHOWSTASHSTATE=1 # Montre si éléments stashés ($)
export GIT_PS1_SHOWUNTRACKEDFILES=1 # Montre si fichiers non versionnés (%)
export GIT_PS1_SHOWUPSTREAM=verbose # Avance/Retard par rapport à la branche distante (<) (>) (=)
export GIT_PS1_DESCRIBE_STYLE=branch # Si detached HAED alors affiche des infos utiles
export GIT_PS1_SHOWCOlORHINTS=true # Active les couleurs fournis par .git-prompt.sh

# Surcharge
source ~/.bashrc_extends;
alias ebext='vi ~/.bashrc_extends'

# Conf globale
shopt -s autocd;

# Autocompletion commande basee sur l'historique
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '\e[1;5C': forward-word
bind '\e[1;5D': backward-word
bind '\e[5C': forward-word
bind '\e[5D': backward-word
bind '\e\e[C': forward-word
bind '\e\e[D': backward-word


# Custom
alias x="exit"
alias eb="vi ~/.bashrc"
alias sb="source ~/.bashrc"
alias c="clear"
alias la="ls -la"
alias untargz="tar zxvf "
alias untarbz2="tar xvjf "

# Git
alias gst="git status"
alias gsth="git status .";
alias gfo="git fetch origin"
alias ga="git add"
alias gd="git diff"
alias gc="git commit -m"
alias gbr="git branch "
alias gamend="git commit --amend --no-edit"
alias gdev="git co develop"
alias gglob="workspaceGitCheck"
alias groot='cd `getgitroot`;' # I am Groot.
alias glo="git log --pretty='format:%C(yellow)%h%Creset %C(bold blue)%<(12,trunc)%ci%x08%x08%Creset %s'"
alias glos="glo | head -n 5"
alias ggrep="git grep -i --break";
alias gitoups="git reset HEAD~1; git add ."
alias gitouups="git reset HEAD~2; git add ."
alias gitouuups="git reset HEAD~3; git add ."
alias rmswp="git status | grep \".swp\" | xargs rm"
alias gitshowlast="git show HEAD^..HEAD"
alias gitremoveuntracked="git status --porcelain | sed -e \"s/\?\?//g\" | xargs rm -rf"

function getgitroot() { git rev-parse --show-toplevel; }

# Git : hooks
alias gitDisablePrecommitHook="mv .git/hooks/pre-commit .git/hooks/pre-commit.sample"
alias gitEnablePrecommitHook="mv .git/hooks/pre-commit.sample .git/hooks/pre-commit"

# Check dossier travail
function workspaceGitCheck 
{
  actualPath=`pwd`
  workspace=$MY_WORKSPACE_PATH;
  cd $workspace;
  for project in `ls -d $MY_PROJECTS_PREFIX-*`
  do
    cd $project
    echo -e "\n"---------- $project ----------
    echo '-> Branche actuelle : '$(git rev-parse --abbrev-ref HEAD)
    git status --short
    cd $workspace;
  done;
  echo -e "\n" 
  cd $actualPath
}

# Symfony
function phpunitSfSingle() { php bin/phpunit --configuration app/phpunit.xml --filter="$1"; }
alias fuckcache="rm -rf {app,var}/cache/*"
function sf () { php $(find . -maxdepth 2 -mindepth 1 -name 'console' -type f | head -n 1) $@; }                                                                               

# Current git branch
export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] '
export GIT_PS1_SHOWUNTRACKEDFILES=1

# Terminal naming
function nametab { PROMPT_COMMAND='echo -en "\033]0;'$1'\a"' ; }
function nametabgitproject() { nametab `basename $(getgitroot)`; }
alias ntg='nametabgitproject'

# PhpStorm
alias phpstorm="/usr/local/bin/pstorm"

# Recherche
alias trouve="find . -type f -print | xargs grep"
alias trouvefichier="find . -name "

# Apache
alias apachestart="sudo service apache2 start"
alias apacherestart="sudo service apache2 restart"
alias apachestop="sudo service apache2 stop"
alias apachestatus="sudo service apache2 status"

# Mongo
alias mongostart="sudo service mongod start"
alias mongounlock="sudo rm /data/db/mongod.lock; mongostart;";
alias mongostop="sudo service mongod stop"

# Xdebug
alias enableXdebug="sudo echo; sudo echo /etc/php5/apache2/conf.d/20-xdebug.ini | sudo xargs sed -i 's/;zend/zend/'; apacherestart;";
alias disableXdebug="sudo echo; sudo echo /etc/php5/apache2/conf.d/20-xdebug.ini | sudo xargs sed -i 's/zend/;zend/'; apacherestart;";
alias statusXdebug="cat /etc/php5/apache2/conf.d/20-xdebug.ini | grep zend_extension";

# Auto-Complétion
complete -cf sudo
complete -cf man

# Docker
alias dockerstop="docker stop \$(docker ps -a -q)"
alias dcstart="docker-compose start"
alias dcrestart="docker-compose restart"
alias dcstop="docker-compose stop"
alias dockerphp56="docker run php:5.6 php -r "
alias dockerphp7="docker run php:7 php -r "

# Atoum
alias atoum="clear; php vendor/atoum/atoum/bin/atoum "
alias a="atoum"
ai () {
    fileTest=`echo $1 | sed 's/src/tests\/units/'`;
    clear
    echo -e "Tested : \"$fileTest\"\n"
    php vendor/atoum/atoum/bin/atoum `getgitroot`/$fileTest
}
