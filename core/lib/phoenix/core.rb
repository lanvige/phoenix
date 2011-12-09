require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
#require "active_support/railtie"
require 'haml'
require 'simple_form'

module Phoenix
  module Core
  end
end

require 'phoenix/core/controller_helpers'
require 'phoenix/core/engine'