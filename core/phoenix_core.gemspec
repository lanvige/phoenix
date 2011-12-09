# encoding: UTF-8
version = File.read(File.expand_path("../../PHOENIX_VERSION", __FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "phoenix_core"
  s.version     = version
  
  s.author       = 'Lanvige Jiang'
  s.email        = 'lanvige@gmail.com'
  s.homepage     = 'http://lanvige.com'

  s.summary     = 'Core Engine.'
  s.description = 'Its used for build core structure, dont contain biz.'

  s.required_ruby_version = '>= 1.9.2'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]
  s.require_path = 'lib'
  
  s.add_dependency "rails", "~> 3.1.3"
  s.add_dependency "jquery-rails"
  s.add_dependency 'haml'
  s.add_dependency 'simple_form'

  s.add_development_dependency "haml-rails"
end
