module Phoenix::Core
  module UrlHelpers
    def phoenix
      Phoenix::Core::Engine.routes.url_helpers
    end
  end
end
