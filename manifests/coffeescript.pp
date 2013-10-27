# Class: coffeescript
#
# This module manages coffeescript
#
# Parameters:
#
# Actions:
#
# Requires:
# node package manager to be installed
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class coffeescript {

  if $node_installed == "true" {
    package {"coffee-script":
      provider => npm, 
      ensure   => "installed"
    }
  }
}
