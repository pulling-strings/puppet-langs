class build_essential {

  if (!defined(Package['build-essential'])) {
    package{"build-essential":
      ensure	=> "installed"
    }
  }
}
