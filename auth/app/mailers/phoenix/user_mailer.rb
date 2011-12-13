module Phoenix
  class UserMailer < Phoenix::BaseMailer
    include Devise::Mailers::Helpers
    
    layout "/phoenix/layouts/mailer"
    
    default :from => "phoenix@lanvige.com"
    
    def confirmation_instructions(user)
      devise_mail(user, :confirmation_instructions)
    end
    
    # UserMailer.welcome_instructions(@user).deliver
    def welcome_instructions(user)
      @user = user
      mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to use Phoenix Engine")
    end

    def reset_password_instructions(user)
      devise_mail(user, :reset_password_instructions)
    end

    def unlock_instructions(user)
      devise_mail(user, :unlock_instructions)
    end
      
    #def confirmation_instructions_bak(user)
    #  @user = user
    #  #@user_confirmation_url = "hahahahaa"
    #  mail(:to => "#{user.name} <#{user.email}>", :subject => "Confirm your account...")
    #end
    
    def reset_password_instructions_bak(user)
      @user = user
      @edit_password_reset_url = phoenix.edit_user_password_url(:reset_password_token => user.reset_password_token)
      mail(:to => user.email, :subject => "zheke.me" + ' ' + I18n.t(:password_reset_instructions))
    end
  end
end