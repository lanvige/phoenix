module Phoenix
  module Authentication
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engine_name 'phoenix_authentication'

      config.autoload_paths += %W(#{config.root}/lib)
      # Load the locals under sub-folder
      config.i18n.load_path += Dir[File.join(config.root, 'config', 'locales', '**', '*.{rb,yml}').to_s]

      # Register Mongoid observers
      # config.mongoid.observers = :'phoenix/user_observer'
      
      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end
        
        Dir.glob(File.join(File.dirname(__FILE__), "../../../../app/overrides/*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end
        
      #config.to_prepare &method(:activate).to_proc
      
      #initializer "phoenix.authentication.environment", :after => 'phoenix.environment' do |app|
      #end
    end
  end
end
