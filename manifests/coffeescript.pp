# Setting up coffeescript
class langs::coffeescript {
  if($::node_installed == 'true'){
    package {'coffee-script':
      ensure   => installed,
      provider => npm
    }
  }
}
