Phoenix::Core::Engine.routes.draw do
  # We need to be tricky here or Devise loads up the defaults again.
  devise_for :user,
             :class_name => 'Phoenix::User',
             :controllers => { :registrations => "phoenix/registrations",
                               :password      => "phoenix/passwords",
                               :sessions      => 'phoenix/sessions'},
             :path_names => { :sign_out => 'logout' }

  devise_scope :user do
    get '/signup' => 'registrations#new', :as => :signup
    get '/login' => 'sessions#new', :as => :login
    get "/logout" => "sessions#destroy", :as => :logout
  end

  resources :users, :only => [:index, :show, :edit, :update] do
    get 'plan'
  end

  match 'plan' => 'users#plan'
end
