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
export PACKAGES="${HOME}/Packages";
export SERVER="${HOME}/Server";
export TEMP="${HOME}/Temp";
export TESTING="${HOME}/Testing";
export WRITING="${HOME}/Writing";

#--------------------------------------
# Other Directories
#--------------------------------------
export BART="${CODE}/bart";
export COLLINS="${CODE}/collins";
export DEV_SETUP="${CODE}/dev-setup";
export NOTES="${WRITING}/notes";
export OCTOPRESS="${WRITING}/octopress";

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
# Packages Directory
alias pkg="cd ${PACKAGES}"
# Server Directory
alias srv="cd ${SERVER}"
# Temp Directory
alias tmp="cd ${TEMP}"
# Testing Directory
alias tst="cd ${TESTING}"
# Writing Directory
alias wrt="cd ${WRITING}"

# base Directory
alias bs="cd ${BASE_DIR}"
# zsh Directory
alias zsd="cd ${ZSH_DIR}"
# tmux Directory
alias tmd="cd ${TMUX_DIR}"
# vim Directory
alias vmd="cd ${VIM_DIR}"
# bash Directory
alias bsd="cd ${BASH_DIR}"

#--------------------------------------
# Other Directory Aliases
#--------------------------------------
# Bart Project Directory
alias bart="cd ${BART}"
# Collins Project Directory
alias collins="cd ${COLLINS}"

# Notes Directory
alias note="cd ${NOTES}"
# Octopress Directory
alias oct="cd ${OCTOPRESS}"
# Octopress Posts Directory
alias post="cd ${OCTOPRESS}/source/_posts"

# Dev-setup Directory
alias dvs="cd ${DEV_SETUP}"
# Bash Directory in dev-setup Repository
alias dvsb="cd ${DEV_SETUP}/files/bash"

# zsh Custom Directory
alias zsc="cd ${ZSH_DIR}/bundle/zsh-custom"
# bash Custom Directory
alias bsc="cd ${BASH_DIR}/bundle/bash-custom"
# vim Custom Directory
alias vmc="cd ${VIM_DIR}/bundle/vim-custom"
# tmux Custom Directory
alias tmc="cd ${TMUX_DIR}/bundle/tmux-custom"

#--------------------------------------
# Global Shortcuts
#--------------------------------------
# Clear Screen
alias cl='clear'
# The new 'l'
alias l='ls -AFhl'
# List All
alias la='ls -A'
# Detail List
alias ll='ls -lh'
# Non configured vim
alias vin='vi -u NONE'
# Find file with name
alias fn='find . -name'

# Copy to Mac Clipboard
alias pbc='pbcopy'
# Paste from Mac Clipboad
alias pbv='pbpaste'

# Quick setup for config symlinks
alias bld="bash ${BASE_DIR}/build.sh"
# Open vimrc file
alias vrc='vim ~/.vimrc'
# Source local zshrc to setup custom environment
alias src='source ~/.zshrc'
# Open Bart Project in IntelliJ
alias ij-bart="ij ${BART}"

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

