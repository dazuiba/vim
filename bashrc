## ~/.bashrc: executed by bash(1) for non-login shells.  
 
######################################################################
## 语言、时区
######################################################################
 
#export LANG=en_US.UTF-8
#export LC_CTYPE=zh_CN.UTF-8
#export LANGUAGE=en_US:en
 
#TZ='Asia/Shanghai'; export TZ
 
alias df='df -h'
######################################################################
## Ruby
######################################################################
 
export RI="-f ANSI --width 70 -T"
PATH=$PATH:/var/lib/gems/1.8/bin/:/usr/lib/postgresql/8.3/bin/:~/bin
 
# gems
alias sgu="sudo gem uninstall"
alias gsr="gem search --remote"

######################################################################
## Rails
######################################################################
alias ss='script/server'
alias sc='script/console' 
alias sg='script/generate'
alias log='tail -f log/development.log'
 
######################################################################
## SVN
######################################################################
 
######################################################################
export SVN_EDITOR="vi "
alias sup='svn up' 
alias sst='svn st' # local file changes
alias sstu='svn st -u' # remote repository changes
alias si='svn commit' # commit
# removes all .svn folders from directory recursively
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' 
# adds all unadded files
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' 
alias saa='svnaddall'

## Git
######################################################################
 
alias gpush='git push'
alias gd='git diff'
alias gpull='git pull'
# 设置其他 Git 命令别名
alias gst="git status"
alias gad='git add'
alias gbc='git branch'
alias gci="git commit -a -v"
alias gco="git checkout"
 
function get_git_branch {
    git branch 2> /dev/null | \
        sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
 
function get_git_modified {
    local GIT_MODIFIED=`git-status 2>/dev/null | \
        egrep -c \
        '^#\s*(new file|modified|deleted|copied|renamed|typechange|unknown|unmerged):'`
    if [[ $GIT_MODIFIED > 0 ]]; then
        echo ":$GIT_MODIFIED"
    else
        echo ""
    fi
}
 
 
# # # 
#
# SYS
# #
alias sys="vmstat 3"
alias h='history'
alias md5='md5sum'
alias x="startx"
alias xi='sudo vi'

# CD
alias c='cd ..'
alias ..='cd ..' 
alias ...='cd ../..' 
alias ....='cd ../../..'
alias .....='cd ../../../..'

# SERVICE
# #
alias rc='sudo /etc/rc.d/'
alias sservice='sudo /sbin/service'
alias inid='sudo /etc/init.d/'

# SSH
# #
alias sshpkey='cat ~/.ssh/id_rsa.pub | ssh $1 "cat - >> ~/.ssh/authorized_keys2"'
alias sshx='ssh $1 -p 22223'

# LS
# #
alias ls='ls --color=auto'
alias lss='ls -rhS'
alias lst='ls -rht'
alias ll="ls -lh"
alias la="ls -a"
alias l='ls -lah'
alias lla="ls -lah"
alias exit="clear; exit"
export LS_COLORS="di=31;1:ln=36;1:ex=31;1:*~=31;1:*.html=31;1:*.shtml=37;1"

######################################################################
## ls 的色彩和别名
######################################################################
 
export LS_OPTIONS='--color=auto'
eval `dircolors -b`
alias ls='ls $LS_OPTIONS'
alias l='ls $LS_OPTIONS -lA'
alias ll='ls $LS_OPTIONS -lht'
alias lm='ls $LS_OPTIONS -lt | more'
alias ltr='ls $LS_OPTIONS -ltr' # 按照时间排序
alias lsr='ls $LS_OPTIONS -lSr' # 按照大小排序
alias lll='ls $LS_OPTIONS --sort=size -l'
alias lsd='ls -d */.' # 只显示目录
alias lsl='\ls -l | fgrep -e "->" ' # 只显示链接
 
######################################################################
## Find
######################################################################
 
# alias 不能处理命令行参数，需要自定义 function
function ff { find . -name "$1" -print; }
function gg { find . -type f \( -name '*.hpp' -o -name '*.cpp' \) -print |\
               grep -v include | grep -v rcs | xargs grep "$1"; }
function exchange {
 sudo mv "$1" "$1".switch; 
 sudo mv "$2" "$1";
 sudo  mv "$1".switch "$2";
} 

######################################################################
## apt 命令别名
######################################################################
alias svi='sudo vi'
alias ac='apt-cache'
alias ag='apt-get'
alias acs='apt-cache search'
alias acp='apt-cache policy'
alias agu='sudo apt-get update'
alias agg='sudo apt-get upgrade'
alias agd='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
 
######################################################################
## 其他常用命令别名
######################################################################
 
alias so="source"
alias f="fg"
alias j="jobs -l"
alias m="more"
alias k="kill -9"
alias s="sdcv"
alias grep="grep --color=auto"
alias pgrep="ps awx | grep"
 
######################################################################
## 修改一些危险命令的缺省行为
######################################################################
 
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
 
######################################################################
## 目录
######################################################################

export HISTCONTROL=ignoredups

export HISTTIMEFORMAT='%F %T '

shopt -s cdspell

CDPATH=./:../:~:~/dev
export CDPATH
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; } 
 
# Local Variables:
# coding: utf-8-unix
# mode: outline-minor
# outline-regexp: "^## "
# End:
