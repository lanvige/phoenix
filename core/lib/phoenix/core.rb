require "action_controller/railtie"
#require "active_resource/railtie"
require "active_support/railtie"

require 'rails/generators'
require 'haml'
require 'jquery-rails'
require 'simple_form'

module Phoenix
  module Core
  end
end

require 'phoenix/core/controller_helpers'
require 'phoenix/core/engine'
require 'phoenix/core/ssl_requirement'
require 'phoenix/core/development_mail_interceptor'

# register generator
require 'generators/phoenix/dummy/dummy_generator'
require 'generators/phoenix/sandbox/sandbox_generator'
