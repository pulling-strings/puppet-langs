# A class which sets up programming languages
class langs {
  include jdk
  include ruby
  include langs::erlang
  include coffeescript
  include build_essential
}
