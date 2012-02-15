Phoenix::Core::Engine.routes.draw do
  
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
    get 'signup' => 'registrations#new', :as => :signup
    post 'login' => 'sessions#new', :as => :login
    delete "logout" => "sessions#destroy", :as => :logout
    #get "forgot_password" => "passwords#new", :as => :forgotpassword
    #get "confirmation" => "confirmations#new", :as => :confirmation
  end

  #resources :users, :only => [:index, :show]
  #resource :profile, :only => [:edit, :update]
end