Rails.application.routes.draw do
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :messages, only: [:index, :new, :create, :show]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :transactions, only: [:index, :new, :create, :show]
  resources :categories, only: [:index, :show]
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  get    'login'   => 'sessions#new' 
  post   'login'   => 'sessions#create' 
  delete 'logout'  => 'sessions#destroy'
  get 'signup'  => 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
