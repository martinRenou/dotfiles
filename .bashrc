
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


export CHROME_BIN=chromium-browser

activate () {
    cd /home/martin/github/martinRenou/$1
    conda activate $1
}
