Rails.application.routes.draw do
  get 'checkins/create'
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :messages, only: [:index, :new, :create, :show]
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :transactions, only: [:index, :new, :create, :show, :update, :destroy]
  resources :categories, only: [:index]
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  get    'login'   => 'sessions#new' 
  post   'login'   => 'sessions#create' 
  delete 'logout'  => 'sessions#destroy'
  get 'signup'  => 'users#new'
  post 'signup' => 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
