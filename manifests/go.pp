# Setting up go lang
class langs::go {
  $version = '1.4'
  $release = "go${version}.linux-amd64"
  $url = "https://storage.googleapis.com/golang/${release}.tar.gz"
  $target = '/usr/local/'
  $sum = 'cd82abcb0734f82f7cf2d576c9528cebdafac4c6'

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

  
  file{'/etc/profile.d/go.sh':
    content  => 'export PATH=$PATH:/usr/local/go/bin'
  }


}
