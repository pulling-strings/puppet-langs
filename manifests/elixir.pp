# setting up elixir lang
class langs::elixir {
  $version = 'v1.0.4'

  ensure_resource('package', 'unzip', {'ensure' => 'present' })

  $url = "https://github.com/elixir-lang/elixir/releases/download/${version}/Precompiled.zip"

  file{"/usr/share/elixir-${version}":
    ensure => directory,
  } ->

  archive { $version:
    ensure        => present,
    url           => $url,
    digest_string => 'bf7225c6424371d52b22a12d6a9d99cb',
    src_target    => '/usr/src',
    target        => "/usr/share/elixir",
    extension     => 'zip',
    require       => Package['unzip'],
  }

  file{'/usr/bin/mix':
    ensure => link,
    target => "/usr/share/elixir/${version}/bin/mix"
  }

  file{'/usr/bin/iex':
    ensure => link,
    target => "/usr/share/elixir/${version}/bin/iex"
  }

  file{'/usr/bin/elixir':
    ensure => link,
    target => "/usr/share/elixir/${version}/bin/elixir"
  }
}
