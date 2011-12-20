require 'phoenix_core'
require 'factory_girl_rails'

module Phoenix
  module Testing
    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      # Load the factories of all currently loaded engines
      def load_factories
        Phoenix.engines.each do |engine_const|
          if engine_const.respond_to?(:factory_paths)
            engine_const.send(:factory_paths).each do |path|
              FactoryGirl.definition_file_paths << path
            end
          end
        end
        FactoryGirl.find_definitions
      end
    end

    require 'phoenix/testing/railtie' if defined?(Rails)

    autoload :ControllerMacros, 'phoenix/testing/controller_macros'
    autoload :RequestMacros, 'phoenix/testing/request_macros'
  end
end
