#!/usr/bin/env bash

# ============================================================================ #
# All local aliases and shortcuts are set in this file. There will be no
# functions included in the file, just `export` and `alias` commands.
# ============================================================================ #

#==========================================================
# Directory Exports
#==========================================================

#--------------------------------------
# Global Directories
#--------------------------------------
export CODE="${HOME}/Code";
export DOCUMENTS="${HOME}/Documents";
export DOWNLOADS="${HOME}/Downloads";
export SERVER="${HOME}/Server";
export TEMP="${HOME}/Temp";
export TESTING="${HOME}/Testing";
export WRITING="${HOME}/Writing";

#--------------------------------------
# Other Directories
#--------------------------------------
export BART="${CODE}/bart";
export OCTOPRESS="${WRITING}/octopress";
export DEVSETUP="${CODE}/dev-setup";


#==========================================================
# Aliases
#==========================================================

#--------------------------------------
# Global Directory Aliases
#--------------------------------------
# Code Directory
alias c="cd ${CODE}"
# Documents Directory
alias doc="cd ${DOCUMENTS}"
# Downloads Directory
alias dl="cd ${DOWNLOADS}"
# Server Directory
alias srv="cd ${SERVER}"
# Temp Directory
alias tmp="cd ${TEMP}"
# Testing Directory
alias tst="cd ${TESTING}"
# Writing Directory
alias wrt="cd ${WRITING}"

#--------------------------------------
# Other Directory Aliases
#--------------------------------------
# Bart Project Directory
alias bart="cd ${BART}"
# Octopress Directory
alias oct="cd ${OCTOPRESS}"
# Octopress Posts Directory
alias post="cd ${OCTOPRESS}/source/_posts"
# Dev-setup Directory
alias dvs="cd ${DEVSETUP}"
# Bash Directory in dev-setup Repository
alias dvsb="cd ${DEVSETUP}/files/bash"

#--------------------------------------
# Global Shortcuts
#--------------------------------------
# Clear Screen
alias cl='clear'
# Detail List
alias ll='ls -l'
# Detail List All
alias lal='ls -al'
# Copy to Mac Clipboard
alias pbc='pbcopy'
# Paste from Mac Clipboad
alias pbv='pbpaste'
# Easy git
alias g='git'

# Open bashrc file
alias brc="vim ${DEVSETUP}/files/bashrc"
# Open vimrc file
alias vrc="vim ${DEVSETUP}/files/vimrc"
# Source local bashrc to setup custom environment
alias rbrc='source ~/.bashrc'
# Run custom environment script
alias sce='set-custom-env'
# Open Bart Project in IntelliJ
alias ij-bart="ij $BART"

#--------------------------------------
# Shortcuts for PHP
#--------------------------------------
# Run phpunit tests
alias pt='phpunit test'

#--------------------------------------
# Shortcuts for tmux
#--------------------------------------
# Attach tmux session
alias tma='tmux attach -t'
# New tmux session
alias tmn='tmux new -s'
# Kill tmux session
alias tmk='tmux kill-session -t'
# List tmux session
alias tml='tmux ls'
# List tmux buffers
alias tmlb='tmux list-buffers'

