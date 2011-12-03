Phoenix::Core::Engine.routes.draw do
  devise_for :user,
             :class_name => 'Phoenix::User',
             :controllers => { :registrations => "phoenix/registrations",
                               :password      => "phoenix/passwords",
                               :sessions      => 'phoenix/sessions'},
             :path_names => { :sign_out => 'logout' }
end

Phoenix::Core::Engine.routes.draw do
  resources :users, :only => [:edit, :update]

  devise_scope :user do
    get '/signup' => 'registrations#new', :as => :signup
    get '/login' => 'sessions#new', :as => :login
    get "/logout" => "sessions#destroy", :as => :logout
  end
end
