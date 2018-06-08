# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# misc
alias wttr='curl -4 wttr.in/Grenoble'
alias mdcat='pandoc -f markdown -t plain'
alias emacs='emacs -nw'
alias ls='ls --color=auto'
alias clean='find . -name "*~" -or -name "\#*\#" -delete'
alias bc='bc -l ~/.bcrc'

# docker
alias docker-stop-all='docker ps -a -q | xargs docker stop'

export EDITOR='/usr/bin/emacs -nw'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PS1='\t \h:\W \u\$ '

# colors in man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export PAGER='less'

# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Load bashrcs
if test -d ~/.bashrc.d/; then
	for bashrc in ~/.bashrc.d/*.sh; do
		test -r "$bashrc" && . "$bashrc"
	done
	unset bashrc
fi
