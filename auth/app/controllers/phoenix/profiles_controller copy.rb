module Phoenix
  class ProfilesController < Phoenix::BaseController

    def index
      @profile = current_user.profile
    end
    
    def edit
    end
    
    def update
    end
  end
end