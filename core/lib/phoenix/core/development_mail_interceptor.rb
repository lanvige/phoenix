# This module used for replace real mail address to myself
# when user signed up in development.
module Phoenix::Core
  class DevelopmentMailInterceptor
    def self.delivering_email(message)
      message.subject = "[#{message.to}] #{message.subject}"
      message.to = "lanvige@gmail.com"
    end  
  end
end