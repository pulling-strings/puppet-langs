# Setting up elm-lang.org
class langs::elm(
  $version = '0.16'
){
  exec{'install elm':
    command => "npm install -g elm@${version}",
    user    => 'root',
    path    => ['/usr/bin','/bin',],
    require => Package['nodejs']
  }

  exec{'install elm-oracle':
    command => "npm install -g elm-oracle",
    user    => 'root',
    path    => ['/usr/bin','/bin',],
    require => Package['nodejs']
  }
}
