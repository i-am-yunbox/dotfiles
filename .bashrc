#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export LANG=en_US.UTF-8

alias mocp='mocp -T transparent-background'
alias la='ls -a'

powerline-daemon -q
. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
