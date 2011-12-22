# Encoding: UTF-8
$:.push File.expand_path('../../core/lib', __FILE__)
require 'phoenix/version'

version = Phoenix::Version.to_s

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'
  s.required_rubygems_version = ">= 1.3.6"
  
  s.name        = "phoenix_dash"
  s.version     = version
  s.summary     = 'User dashboard for Phoenix Engine.'
  s.description = 'User dashboard for Phoenix Engine.'
  
  s.author      = 'Lanvige Jiang'
  s.email       = 'lanvige@gmail.com'
  s.homepage    = 'http://lanvige.com'

  s.rubyforge_project = 'phoenix_dash'
  
  # s.files = Dir['{app,config,lib}/**/*'] + ['README.md']
  s.require_path = 'lib'
  s.requirements << 'none'
  
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
end
