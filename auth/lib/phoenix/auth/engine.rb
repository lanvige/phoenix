module Phoenix
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engine_name 'phoenix_auth'

      config.autoload_paths += %W(#{config.root}/lib)
      
      initializer "phoenix.auth.environment", :after => 'phoenix.environment' do |app|
        #Phoenix::Auth::Config = Phoenix::AuthConfiguration.new
      end
    end
  end
end
