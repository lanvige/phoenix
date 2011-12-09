module Phoenix
  module Social
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engine_name 'phoenix_socail'

      config.autoload_paths += %W(#{config.root}/lib)
      
      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
          Rails.logger.info "My info message"
        end
        
        Dir.glob(File.join(File.dirname(__FILE__), "../../../../app/overrides/*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end
        
      config.to_prepare &method(:activate).to_proc
    end
  end
end