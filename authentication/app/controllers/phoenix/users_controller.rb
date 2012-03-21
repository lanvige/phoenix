module Phoenix
  class UsersController < Phoenix::BaseController
    before_filter :authenticate_user!, :except => [:index]
    
    layout "/phoenix/layouts/application"

    def index
      @users = User.all
    end

    def edit 
      @user = current_user
    end
    
    def show
      @user = User.find_by_slug(params[:id])
    end
  end
end