module Phoenix
  class Profile
    include Mongoid::Document
    include Mongoid::Timestamps
    
    embedded_in :user
    
    field :address
  end
end