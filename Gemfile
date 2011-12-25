source 'http://rubygems.org'

gemspec

# Databse
gem "bson_ext"
gem "mongoid"
gem "mongoid_slug", :require => 'mongoid/slug'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

# Asset template engines
gem "simple_form"
gem "haml"
gem 'jquery-rails'

group :development, :test do
  # gem 'phoenix_testing'
  
  gem 'generator_spec'
  gem 'database_cleaner', :git => 'git://github.com/bmabey/database_cleaner.git'
  
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
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