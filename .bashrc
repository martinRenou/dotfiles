
# Color functions
green () {
    printf -- "\e[32m"
}

lblue () {
    printf -- "\e[94m"
}

yellow () {
    printf -- "\e[93m"
}

magenta () {
    printf -- "\e[35m"
}

nc () {
    printf -- "\e[0m"
}

GIT_PS1_SHOWDIRTYSTATE=true
if [ "$color_prompt" = yes ]; then
    PS1='\[$(green)\]\u@\h: \[$(lblue)\]\w\[$(yellow)\]$(__git_ps1)\[$(green)\]\n \[$(nc)\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export CHROME_BIN=chromium-freeworld

activate () {
    if [ $# -eq 0 ]; then
        conda deactivate
        conda activate ${PWD##*/}
    else
        cd /home/martin/github/$1 && activate
    fi

    alias conda="mamba"
}

complete -W "`ls /home/martin/github | tr '\n' ' '`" activate

create () {
    conda deactivate
    conda create --name ${PWD##*/} --yes -c conda-forge
    conda activate ${PWD##*/}
    mamba install pip nodejs yarn cmake compilers build twine jupyter-packaging flake8 $* --yes -c conda-forge

    alias conda="mamba"
}

# Shameless aliases
alias gut="git"
alias got="git"
alias gt="git"
alias gi="git"
alias g="git"

alias sha="sha256sum"
alias untar="tar zxvf"

alias code="codium"

install () {
    mamba install -c conda-forge $*
}

cd /home/martin

