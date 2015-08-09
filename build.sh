#!/usr/bin/env bash
# ============================================================================ #
# Build file for entire personalized configuration
# ============================================================================ #

#--------------------------------------
# Global Variables
#--------------------------------------
declare -r REPO_DIR="${HOME}"
declare -r REPO_NAME='.base'
declare -r MAIN_FILES_DIR="${HOME}"
declare -r REPO_FILES_DIR="${REPO_DIR}/${REPO_NAME}/files"
declare -r ORIGINAL_DIR="${PWD}"

#--------------------------------------
# Global Functions
#--------------------------------------

##
# Display usage information to user
##
function show_help() {
  cat << USAGE
Usage: $0

Sets up necessary symlinks from the "files" directory in the "${REPO_NAME}"
repostitory to "${MAIN_FILES_DIR}".

  -h / --help  Show this help message.

USAGE
  exit 0
}

#--------------------------------------
# Parse Options
#--------------------------------------
while [[ -n "$*" ]]; do
  case "$1" in
    -h|--help)
      show_help;
      ;;
    *)
      echo "Unknown option: $1"
      show_help;
      ;;
  esac
  shift
done

#==========================================================
# Main Code Path
#==========================================================

cd $REPO_FILES_DIR

files=$(ls -A)
for file in $files
do
	rm -f "${MAIN_FILES_DIR}/${file}"
  ln -sf "${REPO_FILES_DIR}/${file}" "${MAIN_FILES_DIR}/${file}"
done

cd $ORIGINAL_DIR
