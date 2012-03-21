require "action_controller/railtie"
require "active_resource/railtie"
require "active_support/railtie"
require 'rails/generators'

#require 'rbconfig'

require 'mongoid'
require 'mongoid_slug'

require 'haml'
require 'jquery-rails'
require 'bootstrap-sass'
require 'requirejs-rails'

module Phoenix
  
  # Different between require and autoload.
  # Require will be specified after the autoload.
  autoload :Engine, 'phoenix/extension'
  autoload :Version, 'phoenix/version'
  
  autoload :DummyGenerator, 'generators/phoenix/dummy/dummy_generator'
  autoload :ExtensionGenerator, 'generators/phoenix/extension/extension_generator'

  require 'generators/phoenix/dummy/dummy_generator'
  require 'generators/phoenix/extension/extension_generator'

  class << self
    @@extensions = []

    # Returns an array of modules/extensions representing currently registered Phoenix extensions
    #
    # Example:
    #   Phoenix.extensions  =>  [Phoenix::Core, Phoenix::Pages]
    def extensions
      @@extensions
    end

    # Register an extension with Phoenix
    #
    # Example:
    #   Phoenix.register_extension(Phoenix::Core)
    def register_extension(const)
      return if extension_registered?(const)

      validate_extension!(const)

      @@extensions << const
    end

    # Unregister an extension from Phoenix
    #
    # Example:
    #   Phoenix.unregister_extension(Phoenix::Core)
    def unregister_extension(const)
      @@extensions.delete(const)
    end

    # Returns true if an extension is currently registered with Phoenix
    #
    # Example:
    #   Phoenix.extension_registered?(Phoenix::Core)
    def extension_registered?(const)
      @@extensions.include?(const)
    end

    # Constructs a deprecation warning message and warns with Kernel#warn
    #
    # Example:
    #   Phoenix.deprecate('foo') => "The use of 'foo' is deprecated"
    #
    # An options parameter can be specified to construct a more detailed deprecation message
    #
    # Options:
    #   when - version that this deprecated feature will be removed
    #   replacement - a replacement for what is being deprecated
    #   caller - who called the deprecated feature
    #
    # Example:
    #   Phoenix.deprecate('foo', :when => 'tomorrow', :replacement => 'bar') =>
    #       "The use of 'foo' is deprecated and will be removed at version 2.0. Please use 'bar' instead."
    def deprecate(what, options = {})
      # Build a warning.
      warning = "\n-- DEPRECATION WARNING --\n"
      warning << "The use of '#{what}' is deprecated"
      warning << " and will be removed at version #{options[:when]}" if options[:when]
      warning << "."
      warning << "\nPlease use #{options[:replacement]} instead." if options[:replacement]

      # See if we can trace where this happened
      if options[:caller]
        whos_calling = options[:caller].detect{|c| c =~ %r{#{Rails.root.to_s}}}.inspect.to_s.split(':in').first
        warning << "\nCalled from: #{whos_calling}\n"
      end

      # Give stern talking to.
      warn warning
    end

    # Returns a Pathname to the root of the Phoenix Engine project
    def root
      @root ||= Pathname.new(File.expand_path('../../../../', __FILE__))
    end

    # Returns an array of Pathnames pointing to the root directory of each extension that
    # has been registered with Phoenix.
    #
    # Example:
    #   Phoenix.roots => [#<Pathname:/Users/lanvige/repos/phoenix/core>, #<Pathname:/Users/lanvige/repos/phoeni/setting>]
    #
    # An optional extension_name parameter can be specified to return just the Pathname for
    # the specified extension. This can be represented in Constant, Symbol, or String form.
    #
    # Example:
    #   Phoenix.roots(Phoenix::Core)    =>  #<Pathname:/Users/lanvige/repos/phoenix/core>
    #   Phoenix.roots(:'phoenix/core')  =>  #<Pathname:/Users/lanvige/repos/phoenix/core>
    #   Phoenix.roots("phoenix/core")   =>  #<Pathname:/Users/lanvige/repos/phoenix/core>
    def roots(extension_name = nil)
      return @roots ||= self.extensions.map { |extension| extension.root } if extension_name.nil?

      extension_name.to_s.camelize.constantize.root
    end

    def version
      Phoenix::Version.to_s
    end

    private
      def validate_extension!(const)
        unless const.respond_to?(:root) && const.root.is_a?(Pathname)
          raise InvalidEngineError, "Extension must define a root accessor that returns a pathname to its root"
        end
      end
  end

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


