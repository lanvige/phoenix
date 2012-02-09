Phoenix::Core::Engine.routes.draw do
  
  resources :users, :only => [:index, :show, :edit, :update, ]
  resource :profile, :only => [:edit, :update]
  match 'users/edit' => redirect('/user/edit')
  
  devise_for :users, {
    class_name:   'Phoenix::User',
    module: :devise,
    controllers: { 
      :registrations => "phoenix/registrations",
      :confirmations => "phoenix/confirmations",
      :passwords => "phoenix/passwords",
      :sessions => "phoenix/sessions" }    
    }

  devise_scope :user do
    get '/signup' => 'registrations#new', :as => :signup
    get '/login' => 'sessions#new', :as => :login
    get "/logout" => "sessions#destroy", :as => :logout
    #get "forgot_password" => "passwords#new", :as => :forgotpassword
    #get "confirmation" => "confirmations#new", :as => :confirmation
  end


end