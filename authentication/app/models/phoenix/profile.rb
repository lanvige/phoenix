module Phoenix
  class Profile
    include Mongoid::Document
    include Mongoid::Timestamps
    
    embedded_in :user
    
    field :first_name
    field :last_name
    field :photo
    field :gender
    field :bio
    field :birthday
    field :location
    
    attr_accessible :address
  end
end