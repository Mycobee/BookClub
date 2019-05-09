Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/home', to: 'home#index', as: 'home'
  resources :books, only: [:index, :new, :create, :show]

  resources :authors, only: [:show]
end
