# encoding: UTF-8
version = File.read(File.expand_path("../../PHOENIX_VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'
    
  s.name        = "phoenix_auth"
  s.version     = version
  s.summary     = 'The Authentication Module for Phoenix Engine.'
  s.description = 'Required dependency for Phoenix'
  
  s.author      = 'Lanvige Jiang'
  s.email       = 'lanvige@gmail.com'
  s.homepage    = 'http://lanvige.com'

  s.files = Dir["{app,config,lib}/**/*"] + ["README.md"]
  s.require_path = 'lib'

  s.add_dependency('phoenix_core',   version)
  s.add_dependency 'devise'
  s.add_dependency 'mongoid_slug'
end
