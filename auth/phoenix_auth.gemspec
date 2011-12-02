$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "phoenix/auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "phoenix_auth"
  s.version     = Phoenix::Auth::VERSION

  s.author      = 'Lanvige Jiang'
  s.email       = 'lanvige@gmail.com'
  s.homepage    = 'http://lanvige.com'

  s.summary     = 'Engine deom 4 rails 3.'
  s.description = 'Engine deom 4 rails 3.'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.1.3"
  s.add_dependency "jquery-rails"
  s.add_dependency 'haml'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "haml-rails"
end
