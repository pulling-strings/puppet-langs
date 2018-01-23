# Setting up go lang
class langs::go(
  $timeout = '900'
){
  $version = '1.9.3'
  $release = "go${version}.linux-amd64"
  $url = "https://storage.googleapis.com/golang/${release}.tar.gz"
  $target = '/usr/local/'
  $sum = 'a4da5f4c07dfda8194c4621611aeb7ceaab98af0b38bfb29e1be2ebb04c3556c'

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
