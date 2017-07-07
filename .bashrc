# misc
alias wttr='curl -4 wttr.in/Paris'
alias mdcat='pandoc -f markdown -t plain'

# docker
alias docker-stop-all='docker ps -a -q | xargs docker stop'

export EDITOR=/usr/bin/emacs
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