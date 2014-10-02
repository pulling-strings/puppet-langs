# Installing erlang
class langs::erlang {
  include apt::update

  apt::source { 'erlang-solutions':
      location    => 'http://packages.erlang-solutions.com/ubuntu',
      release     => 'trusty',
      repos       => 'contrib',
      include_src => false,
  }

  apt::key {'erlang-solutions':
    key        => 'D208507CA14F4FCA',
    key_source => 'http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc',
  } ->

  Exec['apt_update'] ->

  package{'erlang':
    ensure  => present,
  }

}
