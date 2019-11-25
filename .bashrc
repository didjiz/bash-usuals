
source ~/.bashrc_native;

################################################################

export EDITOR=vim # Editeur par défaut

# Git / terminal
#export GIT_PS1_SHOWDIRTYSTATE=1 # Montre si modif de la copie locale (*) ou (+) pour l'index
#export GIT_PS1_SHOWSTASHSTATE=1 # Montre si éléments stashés ($)
#export GIT_PS1_SHOWUNTRACKEDFILES=1 # Montre si fichiers non versionnés (%)
#export GIT_PS1_SHOWUPSTREAM=verbose # Avance/Retard par rapport à la branche distante (<) (>) (=)
#export GIT_PS1_DESCRIBE_STYLE=branch # Si detached HAED alors affiche des infos utiles
#export GIT_PS1_SHOWCOlORHINTS=true # Active les couleurs fournis par .git-prompt.sh

# Conf globale
#shopt -s autocd;
#shopt -s checkwinsize

# Autocompletion commande basee sur l'historique
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Custom
alias x="exit"
alias eb="vi ~/.bashrc"
alias sb="source ~/.bashrc"
alias c="clear"
alias ll="ls -l"
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
alias gco="git checkout"
alias gbr="git branch "
alias gamend="git commit --amend --no-edit"
alias gdev="git co develop"
alias gglob="workspaceGitCheck"
alias groot='echo "I am groot !"; cd `getgitroot`;' # I am Groot.
alias glo="git log --pretty='format:%C(yellow)%h%Creset %C(bold blue)%<(12,trunc)%ci%x08%x08%Creset %s'"
alias glos="glo | head -n 5"
alias ggrep="git grep -i --break";
alias gitoups="git reset HEAD~1; git add ."
alias gitouups="git reset HEAD~2; git add ."
alias gitouuups="git reset HEAD~3; git add ."
alias rmswp="git status | grep \".swp\" | xargs rm"
alias gitshowlast="git show HEAD^..HEAD"
alias gitshowlastshort="git show HEAD^..HEAD --name-only"
alias gitshowshort="git show --name-only"
alias gs="git show"
alias gsl="gitshowlast"
alias gss="gitshowshort"
alias gsls="gitshowlastshort"
alias gitremoveuntracked="git status --porcelain | sed -e \"s/\?\?//g\" | xargs rm -rf"
alias gbrhistory="gitShowBranchHistory"
alias gitDisableFilemode="sed -i 's/filemode = true/filemode = false/' .git/config"

function getgitroot() { git rev-parse --show-toplevel; }
function gitextends() { currBranch=$(git rev-parse --abbrev-ref HEAD) ; git co -b $currBranch$1; }
function gitShowBranchHistory () { for branch in `git branch -l | grep -v '*'`;do echo -e `git show --format="%ad (%cr)" --date=format:"%Y-%m-%d %H:%I:%S" $branch | head -n 1` \\t$branch; done | sort -r; }

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
alias fuckcache="rm -rf {app,var}/cache/* ;"
function sf () { php $(find . -maxdepth 2 -mindepth 1 -name 'console' -type f | head -n 1) $@; }                                                                               

# Current git branch
export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] ' # Full path
#export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \W\[\033[31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] ' # Short path
export GIT_PS1_SHOWUNTRACKEDFILES=1

# Terminal naming
function nametab {
    [[ $1 = '.' ]] && name="${PWD##*/}" || name="$1"
    PROMPT_COMMAND='echo -en "\033]0;'$name'\a"' ;
}
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

startXDebugCli () {
    export XDEBUG_CONFIG="idekey=phpstorm-xdebug remote_host="$MY_WORKSPACE_IP
    export PHP_IDE_CONFIG="serverName="$MY_TEST_ENV_URL
}

stopXDebugCli () {
    unset PHP_IDE_CONFIG
    unset XDEBUG_CONFIG
}

# Auto-Complétion
complete -cf sudo
complete -cf man

# Docker
alias dockerstop="docker stop \$(docker ps -a -q)"
alias dps="docker ps -a"
alias dcstart="docker-compose start"
alias dcrestart="docker-compose restart"
alias dcstop="docker-compose stop"
alias dcstopall='docker stop $(docker ps -a -q)'
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

# Ssh
alias ssh-nokey="ssh -o 'PubkeyAuthentication no' "

# Surcharge
source ~/.bashrc_extends;
alias ebext='vi ~/.bashrc_extends'

# Autres 

alias killNautilus="ps -C nautilus -o pid= | xargs kill -9" # He deserved it.
alias killChrome="ps -C chrome -o pid= | xargs kill -9"

tbcheck () {
    wget -q -O - https://www.terre-bitume.org/f109-sud-est \
        | xmllint --html --xpath '//table[@class = "forumline"]' - 2>/dev/null \
        | sed 's/-->»/\n/g' | grep t6490 | sed 's/<[^>]*>/ /g' | sed 's/<br \/>//g' \
        | sed 's/<br>//g' | sed 's/<img[^>]*>//' | sed 's/<!--//g'
}

txtToMd5 () {
    for f in *.txt; do
        md5sum $f 2>/dev/null | sed 's/^\([^ ]*\).*/\1/g' > `echo "./$f" | sed 's/txt/md5/'` ;
    done
}

alias meteo="c && curl fr.wttr.in/Lyon"

