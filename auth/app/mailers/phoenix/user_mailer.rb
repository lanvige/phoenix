module Phoenix
  class UserMailer < Phoenix::BaseMailer    
    layout "/phoenix/layouts/mailer"
    
    default :from => "Phoenix Engine <phoenix@lanvige.com>"
    
    def confirmation_instructions(user)
      @user = user

      mail(:to => "#{user.name} <#{user.email}>",
           :subject => I18n.t('devise.mailer.confirmation_instructions.subject'))
    end
    
    # UserMailer.welcome_instructions(@user).deliver
    def welcome_instructions(user)
      @user = user
      mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to use Phoenix Engine")
    end

    def reset_password_instructions(user)
      #devise_mail(user, :reset_password_instructions)
    end

    def unlock_instructions(user)
      #devise_mail(user, :unlock_instructions)
    end
    
    def reset_password_instructions_bak(user)
      @user = user
      @edit_password_reset_url = phoenix.edit_user_password_url(:reset_password_token => user.reset_password_token)
      mail(:to => user.email, :subject => "zheke.me" + ' ' + I18n.t(:password_reset_instructions))
    end
  end
end