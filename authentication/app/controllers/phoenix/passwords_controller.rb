module Phoenix
  class PasswordsController < Devise::PasswordsController
    
    layout "/phoenix/layouts/application"
    
    def create
      super
    end

    def edit
      super
    end
    
    def update
      super
    end
  end
end