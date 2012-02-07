Phoenix::Core::Engine.routes.draw do
  devise_for :users, {
    class_name:   'Phoenix::User',
    module: :devise,
  }
end