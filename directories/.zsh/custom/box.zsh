#! /usr/bin/env sh

# ============================================================================ #
# All Box specific aliases, shortcuts, and configurations are set here.
# ============================================================================ #

#==========================================================
# Directories - Local
#==========================================================

export OPA="${CODE}/ops-php-anthology";
export COMMON="${OPA}/common";
export INVENTORY="${OPA}/inventory";


#==========================================================
# Aliases
#==========================================================

#--------------------------------------
# Directory Aliases - Local
#--------------------------------------
# Ops PHP Anthology (OPA)
alias opa="cd ${OPA}"
# Common Module in OPA
alias com="cd ${COMMON}"
# Inventory Module in OPA
alias inv="cd ${INVENTORY}"

#--------------------------------------
# Box Directory Aliases - Remote
#--------------------------------------
# Code Directory
alias cdc="cd ~/code"
# OPA
alias cdo="cd ~/code/ops-php-anthology"
# OPA - Inventory
alias cdinv="cd ~/code/ops-php-anthology/inventory"
# OPA - Common
alias cdcom="cd ~/code/ops-php-anthology/common"
# Puppet
alias cdp="cd ~/code/puppet"

#--------------------------------------
# Box Shortcuts
#--------------------------------------
# Run full OPA phpunit test suite
alias pta='bash phpunit-all.sh'
# Open OPA in IntelliJ
alias ij-opa="ij ${OPA}"
# Running Puppet
alias sry='sudo runpuppet -y'
# Access prod
alias prod='ssh prod'
# Access dev
alias dev='ssh dev'
