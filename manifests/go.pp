# Setting up go lang
class langs::go {
  $version = '1.7.3'
  $release = "go${version}.linux-amd64"
  $url = "https://storage.googleapis.com/golang/${release}.tar.gz"
  $target = '/usr/local/'
  $sum = '79430a0027a09b0b3ad57e214c4c1acfdd7af290961dd08d322818895af1ef44'

  archive {$release:
    ensure        => present,
    url           => $url,
    digest_string => $sum,
    digest_type   => 'sha256',
    src_target    => '/usr/src',
    target        => $target,
    extension     => 'tar.gz',
    timeout       => '360'
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
