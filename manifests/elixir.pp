# setting up elixir lang
class langs::elixir {
  $version = 'v0.12.4'

  ensure_resource('package', 'unzip', {'ensure' => 'present' })

  $url = "https://github.com/elixir-lang/elixir/releases/download/${version}/Precompiled.zip"

  file{"/usr/share/elixir-${version}":
    ensure => directory,
  } ->

  archive { $version:
    ensure        => present,
    url           => $url,
    digest_string => 'c6a41e761ee26687ec0939d666e0bc07',
    src_target    => '/usr/src',
    target        => "/usr/share/elixir-${version}",
    extension     => 'zip',
    require       => Package['unzip'],
  }

  file{'/usr/bin/mix':
    ensure => link,
    target => "/usr/share/elixir-${version}/bin/mix"
  }

  file{'/usr/bin/iex':
    ensure => link,
    target => "/usr/share/elixir-${version}/bin/iex"
  }

  file{'/usr/bin/elixir':
    ensure => link,
    target => "/usr/share/elixir-${version}/bin/elixir"
  }
}
