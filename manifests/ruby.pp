# This module manages ruby
class langs::ruby($user=false) {

  unless($::rvm_installed=='true'){
    exec{'gpg key fetch':
      command => 'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3',
      user    => 'root',
      path    => ['/usr/bin','/bin',],
    } -> Class['rvm']
  }

  ensure_packages(['rubygems1.9.1','ruby1.9.1-dev', 'build-essential'])

  include rvm

  rvm::system_user { $langs::ruby::user: }

  $ruby2 = 'ruby-2.1.2'

  if($::rvm_installed=='true'){

    ensure_resource('package', 'pkg-config', {ensure => present})

    package{['libgdbm-dev', 'libncurses5-dev', 'libtool', 'libffi-dev']:
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
