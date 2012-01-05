# Encoding: UTF-8
$:.push File.expand_path('../../core/lib', __FILE__)
require 'phoenix/version'

version = Phoenix::Version.to_s

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'
    
  s.name        = 'phoenix_core'
  s.version     = version
  s.summary     = 'Core Engine.'
  s.description = 'Its used for build core structure, dont contain biz.'
  
  s.author       = 'Lanvige Jiang'
  s.email        = 'lanvige@gmail.com'
  s.homepage     = 'http://lanvige.com'

  s.rubyforge_project = 'phoenix_core'
  
  s.files = Dir['{app,config,lib}/**/*'] + ['README.md']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.add_dependency 'rails',                 '~> 3.2.0.rc2'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'haml'
  s.add_dependency 'sass-rails',            '~> 3.2.3'
  s.add_dependency 'mongoid'
  s.add_dependency 'mongoid_slug'

  s.add_dependency 'state_machine'
  s.add_dependency 'simple_form'
  s.add_dependency 'stringex'
  s.add_dependency 'faker'
  s.add_dependency 'deface'

  s.add_development_dependency 'haml-rails'
end
