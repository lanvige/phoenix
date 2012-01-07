source 'http://rubygems.org'

gemspec

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development, :test do
  gem 'generator_spec'

  gem 'rcov'
  gem 'faker'
  
  platforms :mri_19 do
    gem 'simplecov'
  end
  
  platforms :ruby do
    gem 'spork', '~> 0.9.0.rc'
    gem 'guard-spork'
  end
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end