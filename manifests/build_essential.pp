# includeing build_essential
class langs::build_essential {
  ensure_resource('package', 'build-essential', {ensure => present})
}
