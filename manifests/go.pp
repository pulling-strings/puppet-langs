# Setting up go lang
class langs::go(
  $timeout = '900'
){
  $version = '1.7.4'
  $release = "go${version}.linux-amd64"
  $url = "https://storage.googleapis.com/golang/${release}.tar.gz"
  $target = '/usr/local/'
  $sum = '47fda42e46b4c3ec93fa5d4d4cc6a748aa3f9411a2a2b7e08e3a6d80d753ec8b'

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
