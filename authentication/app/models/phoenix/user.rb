module Phoenix
  class User
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Slug
    
    embeds_one :profile
    
    # Set the collection name in MongoDB
    self.collection_name = 'users' 
    
    # Include default devise modules. Others available are:
    devise :database_authenticatable, :token_authenticatable, :registerable, :recoverable,
           :rememberable, :trackable, :validatable, :timeoutable, :confirmable,
           :encryptable, :encryptor => 'authlogic_sha512'

    field :name,               :type => String, :null => false, :default => ""

    ## Database authenticatable
    field :email,              :type => String, :null => false, :default => ""
    field :encrypted_password, :type => String, :null => false, :default => ""

    ## Recoverable
    field :reset_password_token,   :type => String
    field :reset_password_sent_at, :type => Time

    ## Rememberable
    field :remember_created_at, :type => Time

    ## Trackable
    field :sign_in_count,      :type => Integer, :default => 0
    field :current_sign_in_at, :type => Time
    field :last_sign_in_at,    :type => Time
    field :current_sign_in_ip, :type => String
    field :last_sign_in_ip,    :type => String

    ## Encryptable
    field :password_salt, :type => String

    ## Confirmable
    field :confirmation_token,   :type => String
    field :confirmed_at,         :type => Time
    field :confirmation_sent_at, :type => Time
    field :unconfirmed_email,    :type => String # Only if using reconfirmable

    ## Lockable
    # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
    # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
    # field :locked_at,       :type => Time

    ## Token authenticatable
    field :authentication_token, :type => String


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