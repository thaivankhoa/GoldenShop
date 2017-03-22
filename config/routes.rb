Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'
  get 'about', to: 'welcome#about'

  resources :items

  get 'signup', to: 'users#new'

  post 'users', to: 'users#create'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  #get 'login', to: 'carts#new'

  #post 'login', to: 'carts#create'

  delete 'logout', to: 'sessions#destroy'

  #delete 'logout', to: 'carts#destroy'

  resources :categories
  
  resources :carts

end
