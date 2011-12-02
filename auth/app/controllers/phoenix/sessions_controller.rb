#module Phoenix
  class Phoenix::SessionsController < Devise::SessionsController

    # GET /resource/sign_in
    def new
      Rails.logger.debug { "omniauth1:::::::" }
      Rails.logger.info "My info message"
      
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