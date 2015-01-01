# A class which sets up programming languages
class langs {
  include langs::ruby
  include langs::erlang
  include langs::go
  include langs::node
  include langs::elixir
  include langs::coffeescript
  include langs::build_essential

  class{'jdk':
    version => 7
  }
}
