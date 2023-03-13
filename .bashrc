# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# From curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git
source ~/.bash_git

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

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
PS1='\[$(green)\]: \[$(lblue)\]\w\[$(yellow)\]$(__git_ps1)\[$(green)\]\n> \[$(nc)\]'
DEFAULT=$PS1

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="$HOME/bin/micromamba";
export MAMBA_ROOT_PREFIX="$HOME/micromamba";
__mamba_setup="$('$HOME/bin/micromamba' shell hook --shell bash --prefix '$HOME/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "$HOME/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "$HOME/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="$HOME/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export CHROME_BIN=chromium-freeworld

activate () {
    if [ $# -eq 0 ]; then
        micromamba deactivate
        micromamba activate ${PWD##*/}
    else
        cd $HOME/github/$1 && activate
    fi
}

complete -W "`ls $HOME/github | tr '\n' ' '`" activate

create () {
    micromamba deactivate
    micromamba create --name ${PWD##*/} pip hatchling hatch-jupyter-builder nodejs=16 yarn=1 cmake compilers build twine jupyterlab-night jupyterlab-day jupyter-packaging black flake8 $* --yes -c conda-forge
    activate ${PWD##*/}
}

# Ask Jupyter to ignore user prefixes
export JUPYTER_PREFER_ENV_PATH=1

# Shameless aliases
alias gut="git" && complete -F _complete_alias gut
alias got="git" && complete -F _complete_alias got
alias gt="git" && complete -F _complete_alias gt
alias gi="git" && complete -F _complete_alias gi
alias it="git" && complete -F _complete_alias it
alias g="git" && complete -F _complete_alias g
alias ci="git ci" && complete -F _complete_alias ci
alias st="git st" && complete -F _complete_alias st
alias co="git co" && complete -F _complete_alias co
alias undo="git undo" && complete -F _complete_alias undo
alias show="git show" && complete -F _complete_alias show
alias push="git push" && complete -F _complete_alias push

alias sha="sha256sum"
alias untar="tar zxvf"

alias code="codium"

alias conda="micromamba" && complete -F _complete_alias conda
alias mamba="micromamba" && complete -F _complete_alias mamba

install () {
    micromamba install -c conda-forge $*
}

cd $HOME
