#!/usr/bin/env bash

# ============================================================================ #
# This file is used to store all custom functions
# ============================================================================ #

#==========================================================
# Setup Personalized Bash Prompt
# http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
#==========================================================

##
# Output exit code as a prompt if it is non-zero
# @param status code
##
function __last_cmd_code_ps1() {

  local red='\033[01;31m'

  if [ $1 -ne 0 ]; then
    echo -e "${red}*!!**${1}**!!*${red}"
    return
  fi
}

##
# Setup customized bash prompt
##
function prompt() {

  local nc='\033[0m' # no color
  local red='\033[01;31m'
  local green='\033[01;32m'
  local blue='\033[01;34m'
  local purple='\033[01;35m'
  local cyan='\033[01;36m'

  # User@hostname date time directory\nCommand Number $ - me, # - root
  # __git_ps1 - show current git branch; http://blog.jasonmeridth.com/2010/05/22/git-ps1.html
  local ps1=$(echo $blue'{{'$cyan'\u@'$red'\h '$green'\D{[%B-%d-%Y, %I:%M%p]} '$blue'\w'$purple'$(__git_ps1 " (%s)" 2>/dev/null)'$blue'}}')

  PS1=$(echo '$(__last_cmd_code_ps1 $?)'"$ps1""$nc"'\n[\!]\$ ')
}


#==========================================================
# Special Functions
#==========================================================

##
# Pretty-print json files on stdout using Python's json tool
# @param json file path
##
function json() {
  cat $1 | python -m json.tool
}

##
# Find where function is declared
# @param function name
##
function find_function() {
  # Turn on extended shell debugging
  shopt -s extdebug

  # Dump the function's name, line number and fully qualified source file
  declare -F "$1"

  # Turn off extended shell debugging
  shopt -u extdebug
}

##
# Open IntelliJ project in IntelliJ from command line
# @param IntelliJ project path
##
function ij() {
  local project=$1

  /Applications/IntelliJ\ IDEA\ 14.app/Contents/MacOS/idea $project
}

##
# Outputs to stdout, the absolute path to the Puppet manifest file that
# corresponds to the passed in class name. If the manifests file does not
# exist, the function simply exits.
# This function must be run from somewhere within the Puppet repository.
# Example: if '::role::some::app' is passed in and the Puppet repository
# resides in "$HOME/puppet", the function will output
# "$HOME/puppet/modules/role/manifests/some/app.pp" to stdout.
# @param Full name of the Puppet class. Accepts class names with either a
# leading '::' attached or not. Therefore, both 'role::some::app' and
# '::role::some::app' are accepted.
##
function get_puppet_manifest_file() {
  root_dir=$(git rev-parse --show-toplevel)
  puppet_class_name=$1

  # Remove the leading '::', if it is passed in, since it is not required
  if [[ $puppet_class_name == ::* ]]; then
    puppet_class_name=${puppet_class_name:2}
  fi

  # Split based on ':'
  IFS=':' read -a directories <<< "$puppet_class_name"

  # Sample array for '::role::some::app':
  # directories[0]='role'
  # directories[1]=
  # directories[2]='some'
  # directories[3]=
  # directories[4]='app'
  relative_path="modules/${directories[0]}/manifests"

  # If directories[2] is empty it means the class name passed in was a base
  # class, e.g. "::app". Puppet has a special 'init' file for that case.
  if [[ -z ${directories[2]} ]]; then
    relative_path+="/init"
  else
    # Remove the first directory before we iterate through the array since we
    # took care of it above
    directories=("${directories[@]:1}")

    for directory in "${directories[@]}"
    do
      if [[ ! -z $directory  ]]; then
         relative_path="${relative_path}/${directory}"
      fi
    done
  fi
  # Append .pp to get the manifest file
  relative_path+='.pp'

  full_path="${root_dir}/${relative_path}"
  # Only output the full path if the file exists
  if [ -f $full_path ]; then
    echo "$full_path"$'\r'
  fi
}



