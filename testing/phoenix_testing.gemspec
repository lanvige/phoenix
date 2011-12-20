# Encoding: UTF-8
$:.push File.expand_path('../../core/lib', __FILE__)
require 'phoenix/version'

version = Phoenix::Version.to_s

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'
    
  s.name        = 'phoenix_testing'
  s.version     = version

  s.summary           = 'Testing plugin for Phoenix Engine'
  s.description       = 'This plugin adds the ability to run cucumber and rspec against the Pheonix Engine project'

  s.author      = 'Lanvige Jiang'
  s.email       = 'lanvige@gmail.com'
  s.homepage    = 'http://lanvige.com'

  s.files = Dir['{app,config,lib}/**/*'] + ['README.md']
  s.require_paths     = %w(lib)
  s.requirements << 'none'
  s.test_files        = `git ls-files -- spec/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_dependency 'database_cleaner'
  s.add_dependency 'launchy'
  s.add_dependency 'factory_girl_rails'
  s.add_dependency 'json_pure'
  s.add_dependency 'rack-test'
  s.add_dependency 'rspec-rails'
  s.add_dependency 'fuubar'
  s.add_dependency 'rspec-instafail'
  s.add_dependency 'capybara'
  s.add_dependency 'guard-rspec'
  s.add_dependency 'phoenix_core',            version
end
