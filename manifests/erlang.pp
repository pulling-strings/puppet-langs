# Installing erlang
class langs::erlang {
  include apt::update

  apt::source { 'erlang-solutions':
      location    => 'http://binaries.erlang-solutions.com/debian',
      release     => 'quantal',
      repos       => 'contrib',
      include_src => false,
  }

  apt::key {'erlang-solutions':
    key        => 'D208507CA14F4FCA',
    key_source => 'http://binaries.erlang-solutions.com/debian/erlang_solutions.asc',
  } ->

  Exec['apt_update'] ->

  package{'esl-erlang':
    ensure  => present,
  }

}
