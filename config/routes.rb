PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
 
  
  resources :users, except: [:destroy, :index, :new]
  get 'register', to: 'users#new'
  
  resources :posts, except: [:destroy] do
    member do
      post 'vote'
      end
    resources :comments, only: [:create] do
      member do
        post 'vote'
      end
    end
  end

  
  resources :categories, except: [:destroy]

   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'logout', to: 'sessions#logout'
 # resources :sessions, only: [:new, :create, :destroy] alternative using restful resources
  
end
