# Add this file to fix root_path issue with authenticate_user
# Detail: https://github.com/plataformatec/devise/issues/1229

module Devise
  class FailureApp < ActionController::Metal
    include Phoenix::Core::Engine.routes.url_helpers
  end
end