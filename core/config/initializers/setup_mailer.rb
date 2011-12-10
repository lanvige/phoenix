ActionMailer::Base.delivery_method = :smtp

Mail.register_interceptor(Phoenix::Core::DevelopmentMailInterceptor) if Rails.env.development?  

# This assumes you're running your local development server on port 3000 via script/server
ActionMailer::Base.default_url_options = { :host => "localhost:3000" }

ActionMailer::Base.smtp_settings = {
  :address          => "smtp.gmail.com",
  :port             => 25,
  :domain           => "zhuke.me",
  :authentication   => :login,
  :user_name        => "zhuke.me@gmail.com",
  :password         => "zhuke.me001",
  :tls              => true
}