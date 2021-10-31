Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  resources :messages
  resources :transactions
  resources :categories
  resources :photos
  resources :items
  resources :users
  get    'login'   => 'sessions#new' 
  post   'login'   => 'sessions#create' 
  delete 'logout'  => 'sessions#destroy'
  get 'signup'  => 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
