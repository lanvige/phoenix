module Phoenix
  module Core
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engine_name 'phoenix'

      config.autoload_paths += %W(#{config.root}/lib)
    end
  end
end
