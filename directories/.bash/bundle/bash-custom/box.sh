#! /usr/bin/env bash

# ============================================================================ #
# All Box specific aliases, shortcuts, and configurations are set here.
# ============================================================================ #

#==========================================================
# Box Directories
#==========================================================

export OPA="${CODE}/ops-php-anthology";
export COMMON="${OPA}/common";
export INVENTORY="${OPA}/inventory";


#==========================================================
# Box Aliases
#==========================================================

#--------------------------------------
# Box Directory Aliases
#--------------------------------------
# Ops PHP Anthology (OPA)
alias opa="cd ${OPA}"
# Common Module in OPA
alias com="cd ${COMMON}"
# Inventory Module in OPA
alias inv="cd ${INVENTORY}"

#--------------------------------------
# Box Shortcuts
#--------------------------------------
# Run full OPA phpunit test suite
alias pta='bash phpunit-all.sh'
# Open OPA in IntelliJ
alias ij-opa="ij ${OPA}"

