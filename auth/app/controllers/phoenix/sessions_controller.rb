module Phoenix
  class SessionsController < Devise::SessionsController
    include Phoenix::Core::ControllerHelpers
    
    layout "/phoenix/layouts/login"

    # GET /resource/sign_in
    def new
      super
    end

    # POST /resource/sign_in
    def create
      authenticate_user!

      if user_signed_in?
        respond_to do |format|
          format.html {
            flash.notice = "logged_in_succesfully111"
            redirect_to phoenix.login_path
          }
        end
      else
        flash[:error] = 'devise.failure.invalid'
        render :new
      end
    end

    # GET /resource/sign_out
    def destroy
      session.clear
      super
    end
  end
end