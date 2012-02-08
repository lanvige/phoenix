module Phoenix
  class UserObserver < Mongoid::Observer
    def after_save(user)
      # Create profile
    end
  end
end