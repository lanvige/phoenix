module Phoenix
  class RegistrationsController < Devise::RegistrationsController    
    #before_filter :check_registrations_open!
    
    #layout 'login'

    def create
      RubyProf.start
      Rails.logger.debug { "start create.................." }
      super
      Rails.logger.debug { "finished created.................." }
      results = RubyProf.stop
      
      File.open "#{RAILS_ROOT}/tmp/profile-graph.html", 'w' do |file|
        RubyProf::GraphHtmlPrinter.new(results).print(file)
      end
    end

    def new
      Rails.logger.debug { "start new..................." }
      super
    end

    private
    def check_registrations_open!
      if AppConfig[:registrations_closed]
        flash[:error] = t('registrations.closed')
        redirect_to new_user_session_path
      end
    end
  end
end