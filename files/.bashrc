# Load common configuration
if [ -f ~/.profile ]; then
    source ~/.profile
fi

# Use the autoloader to load all bash configuration
AUTOLOAD_FILE="${BASH_DIR}/autoload/autoload.sh"
if [ -f $AUTOLOAD_FILE ]; then
  source $AUTOLOAD_FILE
fi
