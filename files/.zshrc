# Load common configuration
if [ -f ~/.profile ]; then
    source ~/.profile
fi

# Use the autoloader to load all zsh configuration
AUTOLOAD_FILE="${ZSH_DIR}/autoload/autoload.zsh"
if [ -f $AUTOLOAD_FILE ]; then
  source $AUTOLOAD_FILE
fi
