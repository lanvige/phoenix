module Phoenix
  class UserMailer < Phoenix::BaseMailer
    layout "mailer"
    
    def registration_confirmation(user)
      @title = "Welcome Using PHOENIX Engine..."
      Rails.logger.info "======================================="
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