# This module manages ruby
class langs::ruby($user=false) {

  unless($::rvm_installed=='true'){
    exec{'gpg key fetch':
      command => 'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3',
      user    => 'root',
      path    => ['/usr/bin','/bin',],
    } -> Class['rvm']
  }

  $rubies = ['rubygems1.9.1','ruby1.9.1-dev','ruby2.0-dev','ruby2.1-dev','rake']

  ensure_resource('package', $rubies , {ensure => installed})

  include rvm

  rvm::system_user { $langs::ruby::user: }

  $ruby2 = 'ruby-2.1.2'

  if($::rvm_installed=='true'){

    ensure_resource('package', 'pkg-config', {ensure => present})

    package{['libgdbm-dev', 'libncurses5-dev', 'libtool', 'libffi-dev']:
      ensure  => present
    } ->

    rvm_system_ruby {
      'ruby-1.9':
        ensure       => 'present';
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
