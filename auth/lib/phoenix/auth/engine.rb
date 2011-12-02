module Phoenix
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engine_name 'phoenix'

      #config.autoload_path += %W(#{config.root}/lib)
    end
  end
end
