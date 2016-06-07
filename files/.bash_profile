#!/usr/bin/env bash
export BASE_DIR="${HOME}/.base"
if [ ! -d "${BASE_DIR}" ]; then
  git clone --recursive --quiet "git@github.com:nadeemahmad/dotfiles.git" "${BASE_DIR}"
  bash "${BASE_DIR}/build.sh"
fi

# Load common configuration
if [ -f ~/.profile ]; then
  source ~/.profile
fi

# Load zsh if it's available
if [ -x /usr/local/bin/zsh ]; then
   exec -l /usr/local/bin/zsh
else
   source ~/.bashrc
fi
