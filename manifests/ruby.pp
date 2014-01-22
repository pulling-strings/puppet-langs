# Class: ruby
#
# This module manages ruby
class langs::ruby {

  package{['rubygems','rake']:
    ensure  => installed
  }

  if(!defined(Package['ruby1.9.1-dev'])) {
   package{'ruby1.9.1-dev':
     ensure  => installed
   }
  }


  include rvm

  rvm::system_user { $username: }

  $ruby2 = 'ruby-2.1.0'

  if $rvm_installed=="true" {
    package{['libgdbm-dev', 'libncurses5-dev', 'libtool',
              'pkg-config', 'libffi-dev']:
      ensure  => present
      } ->

      rvm_system_ruby {
        $ruby2:
          ensure      => 'present',
          default_use => true;
      }

      rvm_gem {
        'bundler':
          ruby_version => $ruby2,
          require      => Rvm_system_ruby[$ruby2];
        'rake':
          ruby_version => $ruby2,
          require      => Rvm_system_ruby[$ruby2];
      }
  }
}
