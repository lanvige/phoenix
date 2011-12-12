module Phoenix
  class UserMailer < Devise::Mailer
    layout "/phoenix/layouts/mailer"
    
    def confirmation_instructions(user)
      @title = "Welcome Using PHOENIX Engine..."
      @user_confirmation_url = "hahahahaa"
      
      logger.info "==================confirmation_instructions====================="
      mail(:to => user.email, :subject => @title, :from => "lanvige@gmail.com")
    end
    
    def registration_confirmation(user)
      @title = "Welcome Using PHOENIX Engine..."
      @user_confirmation_url = "hahahahaa"
      
      logger.info "===================registration_confirmation===================="
      mail(:to => user.email, :subject => @title, :from => "lanvige@gmail.com")
    end
    
    def password_reset(user, password)
      @user = user
      @password = password
      mail(:to => user.email,
           :subject => 'Password Reset Notification')
    end
  end
end