###############
#
# Basic Configs
#
###############

# export TERM=xterm-256color
export TERM=tmux-256color
export SHELL=/bin/bash
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export FIGNORE=.svn
export SVN_EDITOR=vim
export SVN_MERGE=$HOME/.dotfiles/scripts/svnMerge.sh
export PATH=$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=$HOME/.dotfiles/scripts:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib
export LD_LIBRARY_PATH=/opt/systemc-2.3.1a/lib-linux64:$LD_LIBRARY_PATH
export LIBRARY_PATH=$HOME/.local/lib
# export DISPLAY=:0

LS_COLORS='ow=01;36;40'
export LS_COLORS 


unset GREP_OPTIONS
alias grep="grep --color=auto --exclude-dir='.svn' --exclude=tags"
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS_COLOR='\033[01;32m'
GIT_COLOR='\033[00;33m'
PS1="\["$PS_COLOR"\]\u@\h:\w"$GIT_COLOR"\$(parse_git_branch)\[\033[00m\] - \D{%H:%M:%S}\n\$ "

## Auto complete
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

## bind keys
bind '"\e\e[D" backward-word'
bind '"\e\e[C" forward-word'


#####################
#
# OS specific configs
#
#####################

# Docker for Windows
export DOCKER_HOST=tcp://localhost:2375


##################
#
# Custom functions
#
##################

function extract() {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar e $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *.tar.xz)   tar xfJ $1      ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a vaild file"
    fi
}

function compress() {
    if [[ -e $2 ]]; then
        case $1 in
            *.tar.bz2)  tar -jcvf $1 $2 ;;
            *.tar.gz)   tar -zcvf $1 $2 ;;
            *.zip)      zip -r $1 $2        ;;
            *)          echo "'$2' cannot be compressed via compress()" ;;
        esac
    else
        echo "'$1' is not a vaild file"
    fi
}

function dirdiff() {
    if [ "$#" -eq 1  ]; then
        vim -c "DirDiff . $1"
    elif [ "$#" -eq 2 ]; then
        vim -c "DirDiff $1 $2"
    else
        echo "usage example: dirdiff <dir1> <dir2>"
    fi
}

function trim() {
    find . -name "*" -type f -print0 | xargs -0 sed -i 's/[[:space:]]*$//'
}

function mem_leak() {
    valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $@
}

function rename() {
    ## example: rename test done
    for i in $1*
    do
        mv "$i" "${i/$1/$2}"
    done
}

function print_npy() {
    for fn in $@; do
        python -c "import numpy; a=numpy.load('$fn'); print(a, a.dtype, a.shape)"
    done
}

function hex2half() {
    for num in $@; do
        python -c "import struct; import numpy as np; d_fp16 = np.frombuffer(struct.pack('<H', int('$num',16)), dtype=np.float16)[0]; print('{}'.format(d_fp16))"
    done
}

function half2hex() {
    for fn in $@; do
        python -c "import numpy as np; h_fp16 = hex(np.float16('$fn').view('<H'))[2:].zfill(4); print('{}'.format(h_fp16))"
    done
}
