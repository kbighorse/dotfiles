export PATH=/usr/local/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sphinx/bin:$PATH
export MYSQL_HOME=/usr/local/mysql
export MYSQL=$MYSQL_HOME/bin

export POSTGRESQL_HOME=/usr/local/Cellar/postgresql/9.0.4
export POSTGRESQL=$POSTGRESQL_HOME/bin

export PATH=$PATH:$MYSQL:$POSTGRESQL #:$MAGICK:$FLEX_HOME:$SVN:$M2:$GLASSFISH:$JRUBY
export JAVA_OPTS="-Xms256m -Xmx512m -XX:MaxPermSize=1024m"
export SVN_EDITOR=vi

# node modules
export NODE_PATH="/usr/local/lib/node_modules"

export EDITOR="subl -w"
#export HISTCONTROL=ignoredups

export ARCHFLAGS="-arch x86_64"

# enabling ps -ef
export COMMAND_MODE='unix2003'

# admin user
export ADMIN_USER_ID='2'

# admin user
export LC_CTYPE="utf-8"

# redis
export REDIS_URL="redis://127.0.0.1:6379/0"

# git shortcuts
alias gst='git status'
alias gl='git pull origin develop'
alias gp='git push origin develop'
alias gd='git diff | subl'
alias gc='git commit -a'
alias gb='git branch'
alias gba='git branch -a'
alias cdpd='cap deploy:pending:diff | subl'
alias ga='git add -A'
alias glog='git log --oneline'

# hub
# alias git=hub

# rails shortcuts
alias ss='ruby script/server'
alias ssc='ruby script/server -e development_cached'
alias sdc='ruby script/dev/crawler 500'
alias sdcy='ruby script/dev/crawler 500 y'
alias sc='ruby script/console'
alias tcc='rake tmp:cache:clear'

# heroku shortcuts
alias hrc='heroku run console --app tradingpost'
alias hl='heroku logs --tail --app tradingpost'
alias hc='heroku config --app tradingpost'

# venturelab servers
alias vsh='ssh ec2-user@shell.venture-lab.org'
alias vm='ssh ec2-user@mailer.venture-lab.org'
alias vn1='ssh ec2-user@novo1.venture-lab.org'
alias vn2='ssh ec2-user@novo2.venture-lab.org'
alias vn3='ssh ec2-user@novo3.venture-lab.org'
alias vn4='ssh ec2-user@novo4.venture-lab.org'
alias vn5='ssh ec2-user@novo5.venture-lab.org'
alias vn6='ssh ec2-user@novo6.venture-lab.org'
alias vb='ssh ec2-user@buyuk.venture-lab.org'

# edit this file
alias bp='subl ~/.bash_profile'
alias sbp='source ~/.bash_profile'

source ~/.git-completion.sh
export PS1='\h:\w$(__git_ps1 "(%s)") \u\$ '
function proml(){
  local        BLUE="\[\033[0;34m\]"
  local  LIGHT_BLUE="\[\033[1;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local       RESET="\[\033[0;39m\]"

  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\W\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

  DATE="$LIGHT_BLUE[$RED\$(date +%H:%M)$LIGHT_BLUE]"
  WD="$LIGHT_BLUE[$RED\W$LIGHT_BLUE]"
  GIT="$LIGHT_RED\$(parse_git_branch)$RESET"

  PS1="\n${TITLEBAR}${DATE}${WD}${GIT}\$ "
  PS2='> '
  PS4='+ '
}

proml
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
