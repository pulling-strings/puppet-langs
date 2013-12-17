# A class which sets up programming languages
class langs {
  include ruby
  include langs::erlang
  include coffeescript
  include build_essential

  class{'jdk':
    version => 7
  }
}
