# ============================================================================ #
# This file is used to store all custom functions
# ============================================================================ #

#==========================================================
# Special Functions
#==========================================================

##
# Pretty-print json files on stdout using Python's json tool
# @param json file path
##
function pjson() {
  cat $1 | python -m json.tool
}

##
# Open IntelliJ project in IntelliJ from command line
# @param IntelliJ project path
##
function ij() {
  local project=$1

  /Applications/IntelliJ\ IDEA\ 15.app/Contents/MacOS/idea $project
}

function mkrepo() {
  ssh nahmad.dev.box.net "git clone --bare ~/testing/fake-repo ~/repositories/${1}.git"
}

function addrem() {
  mkrepo $1
  git remote rm origin
  git remote add origin nahmad@nahmad.dev.box.net:~/repositories/${1}.git
  git checkout master
  git push origin master
  cd ..
  rm -rf ${1}
  cd ~/.vim/bundle
  git submodule add nahmad@nahmad.dev.box.net:~/repositories/${1}.git
  cd ~/.vim
  git commit -am "Added submodule ${1} to vim"
  git push origin master
}

function uall() {
  update_environment vim
  update_environment zsh
  update_environment tmux
}

##
# Outputs, to stdout, the absolute path to the Puppet manifest file that
# corresponds to the passed in class name. If the manifests file does not
# exist, the function simply exits.
# This function must be run from somewhere within the Puppet repository.
# Example: if '::role::some::app' is passed in and the Puppet repository
# resides in "$HOME/puppet", the function will output
# "$HOME/puppet/modules/role/manifests/some/app.pp" to stdout.
#
# @param Full name of the Puppet class. Accepts class names with either a
# leading '::' attached or not. Therefore, both 'role::some::app' and
# '::role::some::app' are accepted.
##
function echo_puppet_manifest_file() {
  root_dir=$(git rev-parse --show-toplevel)
  puppet_class_name=$(echo "$1" | tr -cd '[:alnum:]_:')

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
    echo $full_path | xargs
  fi
}
