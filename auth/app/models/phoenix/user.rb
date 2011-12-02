module Phoenix
  class User
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Slug
    self.collection_name = 'users' 
    
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :timeoutable #:confirmable,
                  
    field :name
    field :email
    field :avatar
    field :bio
    field :website
  end
end