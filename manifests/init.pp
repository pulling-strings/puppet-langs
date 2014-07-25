# A class which sets up programming languages
class langs {
  include ruby
  include langs::erlang
  include langs::node
  include langs::elixir
  include coffeescript
  include build_essential

  class{'jdk':
    version => 7
  }
}
