# Setting up nodejs
class langs::node {

  apt::ppa {'ppa:chris-lea/node.js':
    ensure => absent
  }

  apt::source { 'node-4x':
      ensure   => absent,
      location => 'https://deb.nodesource.com/node_4.x',
      release  => 'xenial',
      repos    => 'main',
      include  => {
        src    => true,
      }
  }

  apt::source { 'node-8x':
      location => 'https://deb.nodesource.com/node_8.x',
      release  => 'xenial',
      repos    => 'main',
      include  => {
        src    => true,
      }
  }

  apt::key {'nodesource':
    id     => '9FD3B784BC1C6FC31A8A0A1C1655A0AB68576280',
    source => 'https://deb.nodesource.com/gpgkey/nodesource.gpg.key',
  }

  -> Exec['apt_update']

  -> package{'nodejs':
    ensure  => present
  }
}
