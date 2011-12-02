module Phoenix
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engine_name 'phoenix_auth'

      initializer "phoenix.auth.environment", :after => 'phoenix.environment' do |app|
        #Phoenix::Auth::Config = Phoenix::AuthConfiguration.new
      end
    end
  end
end
