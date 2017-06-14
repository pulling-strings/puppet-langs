# Installing erlang
class langs::erlang {
  apt::source { 'erlang-solutions':
      location => 'http://packages.erlang-solutions.com/ubuntu',
      release  => 'xenial',
      repos    => 'contrib',
      include  => {
        src => false
      },
  }

  apt::key {'erlang-solutions':
    id     => '434975BD900CCBE4F7EE1B1ED208507CA14F4FCA',
    source => 'http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc',
  } ->

  Exec['apt_update'] ->

  package{['erlang-nox', 'elixir']:
    ensure  => present,
  }

}
