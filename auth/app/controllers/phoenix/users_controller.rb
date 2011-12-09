module Phoenix
  class UsersController < Phoenix::BaseController
    before_filter :authenticate_user!, :except => [:index]

    def index
      @users = User.all
    end

    def edit 
      @user = current_user
    end
    
    def show
      #redirect_to(root_path)
      @user = User.find_by_slug(params[:id])
    end

    def update
      @user = User.find_by_slug(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to(users_path, :notice => 'User Update Successful') }
          format.json
        else
          format.html { render :action => "edit" }
          format.json
        end
      end
    end
  end
end