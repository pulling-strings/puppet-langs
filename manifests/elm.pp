# Setting up elm-lang.org
class langs::elm {
  exec{'install elm':
    command => 'npm install -g elm@0.15.1',
    user    => 'root',
    path    => ['/usr/bin','/bin',],
    require => Package['nodejs']
  }
}
