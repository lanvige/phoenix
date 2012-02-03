# Encoding: UTF-8

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'
    
  s.name        = 'phoenix_authentication'
  s.version     = %q{0.1.0}
  s.summary     = 'The Authentication Module for Phoenix Engine.'
  s.description = 'Required dependency for Phoenix'
  
  s.author      = 'Lanvige Jiang'
  s.email       = 'lanvige@gmail.com'
  s.homepage    = 'http://lanvige.com'
  
  s.rubyforge_project = 'phoenix_auth'

  s.files = Dir['{app,config,lib}/**/*'] + ['README.md']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'phoenix_core'
  s.add_dependency 'devise',       '>= 2.0.0.rc'
end