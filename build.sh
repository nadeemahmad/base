#!/usr/bin/env bash
# ============================================================================ #
# Build file for entire personalized configuration
# ============================================================================ #

#--------------------------------------
# Global Variables
#--------------------------------------
declare -r REPO_DIR="${HOME}"
declare -r REPO_NAME='.dotfiles'
declare -r MAIN_DIR="${HOME}"
declare -r REPO_FILES_DIR="${REPO_DIR}/${REPO_NAME}/files"
declare -r REPO_DIRS_DIR="${REPO_DIR}/${REPO_NAME}/directories"
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
repostitory to "${MAIN_DIR}".

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

cp "${REPO_FILES_DIR}/.startup" "${HOME}/.bash_profile"

cd "${REPO_FILES_DIR}"
files=$(ls -A)
for file in $files
do
	rm -f "${MAIN_DIR}/${file}"
  ln -sf "${REPO_FILES_DIR}/${file}" "${MAIN_DIR}/${file}"
done

cd "${REPO_DIRS_DIR}"
directories=$(ls -A)
for dir in $directories
do
	rm -f "${MAIN_DIR}/${dir}"
  ln -sf "${REPO_DIRS_DIR}/${dir}" "${MAIN_DIR}/${dir}"
done

cd "${ORIGINAL_DIR}"

