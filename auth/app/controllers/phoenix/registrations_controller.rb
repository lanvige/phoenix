module Phoenix
  class RegistrationsController < Devise::RegistrationsController
    #before_filter :check_registrations_open!

    def create
      Rails.logger.debug { "start create.................." }
      super
      Rails.logger.debug { "finished created.................." }
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