module Phoenix
  class RegistrationsController < Devise::RegistrationsController
    include Phoenix::Core::ControllerHelpers
    
    #before_filter :check_registrations_open!
    #ssl_required
    
    layout "/phoenix/layouts/login"

    def new
      RubyProf.start
      super
      results = RubyProf.stop
      
      File.open "/Users/lanvige/repos/profile-register-strat.html", 'a' do |file|
        RubyProf::GraphHtmlPrinter.new(results).print(file)
      end
    end
    
    def create
      RubyProf.start
      @user = build_resource(params[:user])
      
      if resource.save
        set_flash_message(:notice, :signed_up)
        fire_event('phoeinx.user.signup', :user => @user)
        sign_in_and_redirect(:user, @user)
      else
        clean_up_passwords(resource)
        render_with_scope(:new)
      end
      results = RubyProf.stop
      
      File.open "/Users/lanvige/repos/profile-register.html", 'a' do |file|
        RubyProf::GraphHtmlPrinter.new(results).print(file)
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