module Phoenix
  class RegistrationsController < Devise::RegistrationsController
    include Phoenix::Core::ControllerHelpers
    
    #before_filter :check_registrations_open!
    #ssl_required
    
    layout "/phoenix/layouts/application"

    def new
      super
    end
    
    def create
      @user = build_resource(params[:user])
      
      if resource.save
        set_flash_message(:notice, :signed_up)
        #fire_event('phoeinx.user.signup', :user => @user)
        #sign_in_and_redirect(:user, @user)
        redirect_to phoenix.root_path
      else
        #clean_up_passwords(resource)
        #render_with_scope(:new)
      end
    end

    # GET /resource/edit
    def edit
      super
    end
    
    # PUT /resource
    def update
      super
    end

    # DELETE /resource
    def destroy
      super
    end


    private
    def check_registrations_open!
      if AppConfig[:registrations_closed]
        flash[:error] = 'registrations.closed'
        redirect_to new_user_session_path
      end
    end
  end
end