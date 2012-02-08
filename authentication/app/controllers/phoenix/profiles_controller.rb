module Phoenix
  class ProfilesController < Phoenix::BaseController
    
    before_filter :authenticate_user!, :except => [:index]
    layout "/phoenix/layouts/application"
    
    def edit
      @user = current_user
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