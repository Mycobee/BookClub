Rails.application.routes.draw do
  #root to: 'home#index'
  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## get '/home', to: 'home#index', as: 'home'
  #resources :books, only: [:index, :new, :create, :show, :destroy] do
  #  resources :reviews, only: [:new, :create]
  #end
  #resources :reviews, only: [:index, :destroy]
  #resources :authors, only: [:show, :destroy]

	#handrolled prework re-route
	get '/', to: 'home#index', as: 'root'
	
	get '/books', to: 'books#index', as: 'books'	
	get '/books/new', to: 'books#new', as: 'new_book'
	get '/books/:id', to: 'books#show', as: 'book'	
	post '/books', to: 'books#create'	
	delete '/books/:id', to: 'books#destroy'	

	get '/authors/:id', to: 'authors#show', as: 'author'
	delete '/authors/:id', to: 'authors#destroy'	

	get '/reviews', to: 'reviews#index', as: 'reviews'	
	delete '/reviews/:id', to: 'reviews#destroy', as: 'review'

	get '/books/:book_id/reviews/new', to: 'reviews#new', as: 'new_book_review'
	post '/books/:book_id/reviews', to: 'reviews#create', as: 'book_reviews'
end
