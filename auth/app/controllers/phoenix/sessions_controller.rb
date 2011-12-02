#module Phoenix
  class Phoenix::SessionsController < Devise::SessionsController

    # GET /resource/sign_in
    def new
      # render :new, :layout => 'login'
    end

    # POST /resource/sign_in
    def create
      super
    end

    # GET /resource/sign_out
    def destroy
      super
    end
  end
#end