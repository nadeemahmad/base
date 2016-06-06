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

