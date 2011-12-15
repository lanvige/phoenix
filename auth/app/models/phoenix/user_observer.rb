module Phoenix
  class UserObserver < Mongoid::Observer
    def after_save(user)
      #UserMailer.confirmation_instructions(user).deliver
    end
  end
end