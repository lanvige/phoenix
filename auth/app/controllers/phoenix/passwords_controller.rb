module Phoenix
  class PasswordsController < ::Devise::PasswordsController
    def create
      super     
    end
    
    def edit
      super      
    end
  end
end