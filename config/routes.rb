Rails.application.routes.draw do




  get 'toppages/index'
  get 'favorites/new'
  get 'favorites/create'
  get 'favorites/destroy'
  resources :favorites
  get 'signup', to: "users#new"
  resources :toppages, only: [:index] 
      
  resources :users 
  resources :textbooks, only: [:show]

  resources :topics do
    resources :exams
  end
  resources :t_contents
  resources :s_contents
  resources :answers
  resources :guests
  
  
  
  
  resources :posts do
    collection do
      get :search
    end
  end
  
  root to: "toppages#index"
  
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
end
