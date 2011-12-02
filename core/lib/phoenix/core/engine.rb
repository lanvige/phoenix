module Phoenix
  module Core
    class Engine < Rails::Engine
      isolate_namespace PhoenixCore
    end
  end
end
