require 'phoenix_core'
require 'devise'

module Phoenix
  module Authentication
    def self.config(&block)
      yield(Phoenix::Authentication::Config)
    end
  end
end

require 'phoenix/authentication/engine'