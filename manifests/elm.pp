# Setting up elm-lang.org
class langs::elm(
  $version = '0.18'
){
  exec{'install elm':
    command => "npm install -g elm@${version}",
    user    => 'root',
    path    => ['/usr/bin','/bin',],
    require => Package['nodejs'],
    unless  => "test -f /usr/bin/elm && /usr/bin/elm | grep ${version}"
  }

  exec{'install elm-oracle':
    command => 'npm install -g elm-oracle',
    user    => 'root',
    path    => ['/usr/bin','/bin',],
    require => Package['nodejs'],
    unless  => 'test -f /usr/bin/elm-oracle'
  }

  # elm format setup

  $release = '0.5.2-alpha'
  $tar = "elm-format-0.18-${release}-linux-x64.tgz"
  $url = "https://github.com/avh4/elm-format/releases/download/${release}/${tar}"
  $sum = '0d33573442225b28346cb348a97ee9d0cfbbd4cb84ae0aa96a4237b96f4cf653'

  archive {$release:
    ensure        => present,
    url           => $url,
    digest_string => $sum,
    digest_type   => 'sha256',
    src_target    => '/usr/src',
    target        => '/opt',
    extension     => 'tar.gz',
    timeout       => '360'
  } ->
  
  file{'/usr/local/bin/elm-format':
    ensure => link,
    target => "/opt/${release}/elm-format"
  }

}
