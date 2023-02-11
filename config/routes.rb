Rails.application.routes.draw do
  
  devise_for :users 

 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
 
  resources :fbpages, only: [:index]

  resources :users, only: [:show, :index]
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    
  end
  
  resources :likes, only: [:create, :destroy]

end
