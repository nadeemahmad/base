# ============================================================================ #
# Cross Shell Configuration File
# The purpose of this file is to setup both zsh and bash and to enable
# configuration and customization for tmux and vim. This file will also be
# used to setup the $PATH and any other major global exports (this should be
# be limited to absolute top level references that are required before
# anything else is run). This file needs to be referenced in both `.zprofile`
# and `.bash_profile`, and should also be referenced in `.bashrc` and
# `.zshrc`.
# ============================================================================ #

export POWERLINE_ROOT='/usr/local/lib/python2.7/site-packages'
export HOSTNAME="$(hostname)"
if [[ "${HOSTNAME}" == *local ]]; then

  GIT_PATH='/usr/local/git/bin'
  DEVTOOLS_PATH='/Users/nahmad/Code/devtools/bin'
  SYSTEM_BIN_PATH='/usr/local/bin:/usr/bin:/bin'
  SYSTEM_SBIN_PATH='/usr/local/sbin:/usr/sbin:/sbin'
  GNUBIN_PATH="$(brew --prefix coreutils)/libexec/gnubin"

  export PATH="${DEVTOOLS_PATH}:${GIT_PATH}:${GNUBIN_PATH}:${SYSTEM_BIN_PATH}:${SYSTEM_SBIN_PATH}"

  if which rbenv > /dev/null
  then
    eval "$(rbenv init -)"
  fi

  if [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]]
  then
    . $(brew --prefix)/etc/profile.d/autojump.sh
  fi

else
  # User specific environment and startup programs
  export PATH="${PATH}:${HOME}/bin"
fi

# Main directories/git repositories
export BASE_DIR="${HOME}/.base"
export ZSH_DIR="${HOME}/.zsh"
export BASH_DIR="${HOME}/.bash"
export VIM_DIR="${HOME}/.vim"

