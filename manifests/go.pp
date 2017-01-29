# Setting up go lang
class langs::go(
  $timeout = '900'
){
  $version = '1.7.5'
  $release = "go${version}.linux-amd64"
  $url = "https://storage.googleapis.com/golang/${release}.tar.gz"
  $target = '/usr/local/'
  $sum = '2e4dd6c44f0693bef4e7b46cc701513d74c3cc44f2419bf519d7868b12931ac3'

  archive {$release:
    ensure        => present,
    url           => $url,
    digest_string => $sum,
    digest_type   => 'sha256',
    src_target    => '/usr/src',
    target        => $target,
    extension     => 'tar.gz',
    timeout       => $timeout
  } ->

  file{'/usr/local/go':
    ensure => link,
    target => "${target}/${release}/go/"
  }

  
  file{'/usr/bin/go':
    ensure => link,
    target => "${target}/${release}/go/bin/go"
  }

}
