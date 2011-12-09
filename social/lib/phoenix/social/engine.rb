module Phoenix
  module Social
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engine_name 'phoenix_socail'

      config.autoload_paths += %W(#{config.root}/lib)
    end
  end
end
