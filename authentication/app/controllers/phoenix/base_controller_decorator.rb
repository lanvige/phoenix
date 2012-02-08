Phoenix::BaseController.class_eval do
  before_filter :set_current_user
  
  private
    def set_current_user
      Phoenix::User.current = current_user
    end
end
