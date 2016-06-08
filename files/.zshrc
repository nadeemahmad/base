# Load common configuration
if [ -f ~/.profile ]; then
    source ~/.profile
fi

export SHELL='/usr/local/bin/zsh'
export VISUAL=vim
export EDITOR=vim

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="${ZSH_DIR}/custom"
source "${ZSH_CUSTOM}/aliases.zsh"
source "${ZSH_CUSTOM}/functions.zsh"
source "${ZSH_CUSTOM}/vi-mode.plugin.zsh"

POWERLINE_ZSH_BINDINGS="${POWERLINE_ROOT}/powerline/bindings/zsh/powerline.zsh"
if [ -f "${POWERLINE_ZSH_BINDINGS}" ]; then
  source "${POWERLINE_ZSH_BINDINGS}"
fi

