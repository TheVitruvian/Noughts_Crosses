N::Application.routes.draw do

  resources :users
  resources :games do
    member do
      put :make_move
    end
  end
  resources :sessions, only: [:new, :create, :destroy]


  delete "/logout", to: "sessions#destroy",  as: "logout"

  root :to => 'users#index'
end
