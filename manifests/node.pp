# Setting up nodejs
class langs::node {

  apt::ppa {'ppa:chris-lea/node.js':
    ensure => absent
  }

  apt::source { 'nodesource':
      location    => 'https://deb.nodesource.com/node_0.10',
      release     => 'vivid',
      repos       => 'main',
      include_src => true,
  }

  apt::key {'nodesource':
    key        => '1655A0AB68576280',
    key_source => 'https://deb.nodesource.com/gpgkey/nodesource.gpg.key',
  } ->

  Exec['apt_update'] ->

  package{'nodejs':
    ensure  => present
  }
}
