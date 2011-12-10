Phoenix::UsersController.class_eval do

  def show
    #@user = User.find_by_slug(params[:id])
    #Rails.logger("eeee............................................")
    render(:template => "phoenix/users/plan")
  end
end