Phoenix::Core::Engine.routes.draw do
  devise_for :users,
             :class_name => 'Phoenix::User',
             :controllers => { :registrations => "phoenix/registrations",
                               :confirmations => "phoenix/confirmations",
                               :password      => "phoenix/passwords",
                               :sessions      => 'phoenix/sessions'}

  devise_scope :user do
    get '/signup' => 'registrations#new', :as => :signup
    get '/login' => 'sessions#new', :as => :login
    get "/logout" => "sessions#destroy", :as => :logout
    get "forgot_password" => "passwords#new", :as => :forgotpassword
    #get "confirmation" => "confirmations#new", :as => :confirmation
  end

  resources :users, :only => [:index, :show, :edit, :update]
  
end
