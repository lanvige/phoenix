module Phoenix
  class UserMailer < Devise::Mailer
    # No idea to use devise mailer or write in controller by self.
    layout "/phoenix/layouts/mailer"
    
    def confirmation_instructions(user)
      @title = "Welcome Using PHOENIX Engine..."
      @user_confirmation_url = "hahahahaa"
      
      mail(:to => user.email, :subject => @title, :from => "zhuke.me@gmail.com")
    end

    def welcome_instructions(user)
      
    end
    
    def reset_password_instructions(user)
      default_url_options[:host] = Spree::Config[:site_url]

      @edit_password_reset_url = spree.edit_user_password_url(:reset_password_token => user.reset_password_token)

      mail(:to => user.email,
           :subject => "zheke.me" + ' ' + I18n.t(:password_reset_instructions))
    end
  end
end