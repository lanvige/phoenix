source 'http://rubygems.org'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.2.3'
end

gem 'jquery-rails'

#gem "haml", ">= 3.1.4"
gem "haml-rails", ">= 0.3.4", :group => :development

group :test do
  gem 'guard'
  gem 'guard-rspec', '~> 0.5.0'
  gem 'rspec-rails', '~> 2.8.1'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'shoulda-matchers', '~> 1.0.0'
  gem 'capybara'
  gem 'selenium-webdriver', '2.14.0'
  gem 'database_cleaner'
  gem 'launchy'
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

gemspec