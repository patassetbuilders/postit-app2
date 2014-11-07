PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :users, except: [:destroy]

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  
  resources :categories, except: [:destroy]

   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'logout', to: 'sessions#logout'
 # resources :sessions, only: [:new, :create, :destroy] alternative using restful resources
  
end
