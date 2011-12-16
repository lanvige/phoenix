module Phoenix
  class Profile
    include Mongoid::Timestamps
    
    embedded_in :user
  end
end