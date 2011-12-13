require 'mongoid'

module Phoenix
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engine_name 'phoenix_auth'

      config.autoload_paths += %W(#{config.root}/lib)
      
      # Register Mongoid observers
      config.mongoid.observers = :'phoenix/user_observer'
      
      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end
        
        Dir.glob(File.join(File.dirname(__FILE__), "../../../../app/overrides/*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end
        
      config.to_prepare &method(:activate).to_proc
      
      initializer "phoenix.auth.environment", :after => 'phoenix.environment' do |app|
        #Phoenix::Auth::Config = Phoenix::AuthConfiguration.new
      end
    end
  end
end
