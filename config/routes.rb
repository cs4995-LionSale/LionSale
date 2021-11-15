Rails.application.routes.draw do
  get 'sessions/new'
  resources :messages
  resources :transactions
  resources :categories
  resources :photos
  resources :items
  resources :users

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
