# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment', __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require 'phoenix/url_helpers'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'phoenix/core/testing_support/factories'
require 'phoenix/core/testing_support/env'

require 'active_record/fixtures'

fixtures_dir = File.expand_path('../../../core/db/default', __FILE__)
ActiveRecord::Fixtures.create_fixtures(fixtures_dir, ['phoenix/countries', 'phoenix/zones', 'phoenix/zone_members', 'phoenix/states', 'phoenix/roles'])

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, comment the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false
  config.before(:each) do
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation, { :except => ['phoenix_countries', 'phoenix_zones', 'phoenix_zone_members', 'phoenix_states', 'phoenix_roles'] }
    else
      DatabaseCleaner.strategy = :transaction
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
    phoenix::Ability.abilities.delete(AbilityDecorator) if phoenix::Ability.abilities.include?(AbilityDecorator)
  end

  config.include phoenix::UrlHelpers
  config.include Devise::TestHelpers, :type => :controller
  config.include Rack::Test::Methods, :type => :requests
end

if defined? CanCan::Ability
  class AbilityDecorator
    include CanCan::Ability

    def initialize(user)
      cannot :manage, phoenix::Order
    end
  end
end