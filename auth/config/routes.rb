Phoenix::Core::Engine.routes.draw do
  devise_for :user,
             :class_name => 'Phoenix::User',
             :controllers => { :registrations => "phoenix/registrations",
                               :password      => "devise/passwords",
                               :sessions      => 'phoenix/sessions'}

  resources :users, :only => [:edit, :update]

  devise_scope :user do
    get '/signup' => 'registrations#new', :as => :signup
    get '/login' => 'sessions#new', :as => :login
    get "/logout" => "sessions#destroy", :as => :logout
  end
end
