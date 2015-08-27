# Setting up go lang
class langs::go {
  $version = '1.5'
  $release = "go${version}.linux-amd64"
  $url = "https://storage.googleapis.com/golang/${release}.tar.gz"
  $target = '/usr/local/'
  $sum = '5817fa4b2252afdb02e11e8b9dc1d9173ef3bd5a'

  archive {$release:
    ensure        => present,
    url           => $url,
    digest_string => $sum,
    digest_type   => 'sha1',
    src_target    => '/usr/src',
    target        => $target,
    extension     => 'tar.gz',
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
