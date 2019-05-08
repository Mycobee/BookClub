Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/home', to: 'home#index', as: 'home'
  resources :books, only: [:index]

  resources :authors, only: [:show]
end
