version = File.read(File.expand_path("../PHOENIX_VERSION",__FILE__)).strip

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "phoenix"
  s.version     = version
  
  s.author       = 'Lanvige Jiang'
  s.email        = 'lanvige@gmail.com'
  s.homepage     = 'http://lanvige.com'

  s.summary     = 'Engine deom 4 rails 3.'
  s.description = 'Engine deom 4 rails 3.'
  
  s.required_ruby_version     = '>= 1.9.2'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]

  s.add_dependency('phoenix_core',  version)
  s.add_dependency('phoenix_auth',  version)
  s.add_dependency('phoenix_social'  version)

  s.add_dependency "rails", "~> 3.1.3"
  s.add_dependency "jquery-rails"
  s.add_dependency 'haml'

  s.add_development_dependency "haml-rails"
end
