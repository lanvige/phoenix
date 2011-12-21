require 'phoenix_testing'
require 'rails'

module Phoenix
  module Testing
    class Railtie < Rails::Railtie
      railtie_name :phoenix_testing

      class << self
        attr_reader :target_engine_path # :nodoc:

        # Loads Rake tasks to assist with manipulating dummy applications for testing engines. Takes
        # a string representing the path to your application or engine.
        #
        # This function should be used in the Rakefile of your application or engine
        #
        # Example:
        #   Phoenix::Testing::Railtie.load_dummy_tasks(File.dirname(__FILE__))
        #
        #   Phoenix::Testing::Railtie.load_dummy_tasks('/users/reset/code/mynew_app')
        def load_dummy_tasks(app_root)
          @target_engine_path = Pathname.new(app_root.to_s)
          load 'phoenix/tasks/testing.rake'
        end
      end

      config.after_initialize do
        #Phoenix.register_engine(Phoenix::Testing)
        #Testing.load_factories
      end
    end
  end
end
