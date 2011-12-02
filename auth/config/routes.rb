Phoenix::Core::Engine.routes.draw do
  devise_for :user,
             :class_name => 'Phoenix::User',
             :controllers => { :registrations => "phoenix/user_registrations",
                               :password      => "devise/passwords",
                               :sessions      => 'phoenix/user_sessions'} do
    get "/login", :to => "devise/sessions#new" 
    get "/logout", :to => "devise/sessions#destroy"
  end

  resources :users
end
