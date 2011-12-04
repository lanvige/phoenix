module Phoenix
  class SessionsController < Devise::SessionsController

    # GET /resource/sign_in
    def new
      # render :new, :layout => 'login'
    end

    # POST /resource/sign_in
    def create
      RubyProf.start
      Rails.logger.debug { "start login.................." }

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
      Rails.logger.debug { "finished login.................." }
      results = RubyProf.stop
      
      File.open "/Users/lanvige/repos/profile-graph.html", 'a' do |file|
        RubyProf::GraphHtmlPrinter.new(results).print(file)
      end
    end

    # GET /resource/sign_out
    def destroy
      session.clear
      super
    end
  end
end