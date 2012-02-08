module Phoenix
  class Profile
    include Mongoid::Document
    include Mongoid::Timestamps
    
    embedded_in :user
    
    field :real_name
    field :address
    
    attr_accessible :address
  end
end