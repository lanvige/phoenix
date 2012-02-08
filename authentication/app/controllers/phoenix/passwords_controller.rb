module Phoenix
  class PasswordsController < Devise::PasswordsController
    
    layout "/phoenix/layouts/site"
    
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