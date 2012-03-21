#   Copyright (c) 2011-2012, Phoninx Project.
#   See the COPYRIGHT file.

module Phoenix
  class BaseController < ActionController::Base
    protect_from_forgery

    helper RequirejsHelper
  end
end