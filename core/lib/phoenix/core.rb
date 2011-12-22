require "action_controller/railtie"
require "active_resource/railtie"
require "active_support/railtie"
require 'rails/generators'

require 'rbconfig'

require 'haml'
require 'jquery-rails'
require 'simple_form'

module Phoenix
  
  # Different between require and autoload.
  # Require will be specified after the autoload.
  autoload :Engine, 'phoenix/engine'
  autoload :Version, 'phoenix/version'
  
  autoload :DummyGenerator, 'generators/phoenix/dummy/dummy_generator'
  autoload :ExtensionGenerator, 'generators/phoenix/extension/extension_generator'

  require 'generators/phoenix/dummy/dummy_generator'
  require 'generators/phoenix/extension/extension_generator'

  module Core
    require 'phoenix/core/engine' if defined?(Rails)
    
    require 'phoenix/core/controller_helpers'
    require 'phoenix/core/ssl_requirement'
    require 'phoenix/core/development_mail_interceptor'
    
    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end


