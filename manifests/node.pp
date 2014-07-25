# Setting up nodejs
class langs::node {

  apt::ppa {'ppa:chris-lea/node.js':} ->

  package{'nodejs':
    ensure  => present
  }
}
