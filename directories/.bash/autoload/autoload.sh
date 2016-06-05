#! /usr/bin/env bash
# ============================================================================ #
# Nadeem Ahmad's .bashrc file
# Designed to run on Mac OS X
#
# This will be used as the launchpad for all bash related setup commands and
# configurations. Other similar files are sourced from here.
# ============================================================================ #

#==========================================================
# File Sources
#==========================================================

# Source global definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

if [[ "${HOSTNAME}" == *local ]]; then
  # Enable bash completion on Mac OS X
  BREW_PREFIX=$(brew --prefix)
  if [ -f $BREW_PREFIX/etc/bash_completion ]; then
    source $BREW_PREFIX/etc/bash_completion
  fi
fi

# Source local files contanined in $BASH_DIR.
CUSTOM_DIR="${BASH_DIR}/bundle/bash-custom"
if [ -d $CUSTOM_DIR ] && [ "$(ls -A $CUSTOM_DIR)" ]; then
  for file in $CUSTOM_DIR/*
  do
    if [[ $file =~ \.sh$ ]] && [ -f $file ]; then
      source $file
    fi
  done
fi


#==========================================================
# Global Exports
#==========================================================

# Set path
export PATH=$PATH

export EDITOR=vim
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTTIMEFORMAT="%F %T " #to have a time stamp
# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto -I'


#==========================================================
# Other Configurations
#==========================================================

# Set vim keybindings
set -o vi

# Tells bash to append history from many sessions
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

bind '"^[[A":history-search-backward'
bind '"^[[B":history-search-forward'

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source "${POWERLINE_ROOT}/powerline/bindings/bash/powerline.sh"
