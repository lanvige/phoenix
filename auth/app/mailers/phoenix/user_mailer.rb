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
      mail(:to => "#{user.name} <#{user.email}>", 
           :subject => I18n.t("Welcome to use Phoenix Engine"))
    end

    def reset_password_instructions(user)
      @user = user
      mail(:to => "#{user.name} <#{user.email}>", 
           :subject => I18n.t('devise.mailer.reset_password_instructions.subject'))
    end

    def unlock_instructions(user)
      #devise_mail(user, :unlock_instructions)
    end
  end
end