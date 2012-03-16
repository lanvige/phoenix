module Phoenix
  class BaseController < ActionController::Base
    protect_from_forgery

    helper RequirejsHelper
  end
end