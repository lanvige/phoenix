module Phoenix::Core
  class DevelopmentMailInterceptor
    def self.delivering_email(message)  
      message.subject = "[#{message.to}] #{message.subject}"  
      message.to = "lanvige@gmail.com"  
    end  
  end
end