Rails.application.routes.draw do
  root 'posts#index', as: 'home'
  get 'about'=>'pages#about', as: 'about'
  get 'signup'=>'users#new', as: 'signup'
  post 'create'=>'users#create', as: 'pages_create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  resources :posts do
    resources :comments
  end
end
