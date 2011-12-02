module Phoenix
  module Core
    class Engine < Rails::Engine
      isolate_namespace Phoenix
      engline_name 'phoenix'

      config.autoload_path += %W(#{config.root}/lib)
    end
  end
end
