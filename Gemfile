source 'http://rubygems.org'

# rake is not part of the bundle 1.1.0
gem 'rake'

gem 'json'

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

# Databse
gem "bson_ext"
gem "mongoid"
gem "mongoid_slug", :require => 'mongoid/slug'

group :test do
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'rcov'
  gem 'faker'
end

group :cucumber do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'nokogiri'
  gem 'capybara'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'launchy'
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end