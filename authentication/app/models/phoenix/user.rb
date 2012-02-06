module Phoenix
  class User
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Slug
    
    #embeds_one :profile
    
    # Set the collection name in MongoDB
    self.collection_name = 'users' 
    
    # Include default devise modules. Others available are:
    devise :database_authenticatable, :token_authenticatable, :registerable, :recoverable,
           :rememberable, :trackable, :validatable, :timeoutable, :confirmable,
           :encryptable, :encryptor => 'authlogic_sha512'
                  
    field :name
    field :email
    field :avatar
    field :bio
    field :website

    ## Recoverable
    field :reset_password_token,   :type => String
    field :reset_password_sent_at, :type => Time
      
    ## Rememberable
    field :remember_created_at, :type => Time
    
    # define the slug for mongoid_slug
    slug :name
    
    validates_presence_of :name
    validates_format_of :name, :with => /\A[A-Za-z0-9_]+\z/
    validates_length_of :name, :maximum => 32
    validates_uniqueness_of :name, :email, :case_sensitive => false

    attr_accessor  :password_confirmation

    
    # Setup accessible (or protected) attributes for user model
    attr_accessible :name, :email, :password, :avatar, :password_confirmation, :remember_me

    # devise confirm! method overriden
    # Send a welcome mail when user confirmed registe with mail.
    def confirm!
      super
      welcome_instructions
    end

  private
    def self.current
      Thread.current[:user]
    end
    
    def self.current=(user)
      Thread.current[:user] = user
    end

    def welcome_instructions
      UserMailer.welcome_instructions(self).deliver
    end

    # Generate a friendly string randomically to be used as token.
    def self.friendly_token
      SecureRandom.base64(15).tr('+/=', '-_ ').strip.delete("\n")
    end
    
    # Generate a token by looping and ensuring does not already exist.
    def self.generate_token(column)
      loop do
        token = friendly_token
        break token unless find(:first, :conditions => { column => token })
      end
    end
  end
end