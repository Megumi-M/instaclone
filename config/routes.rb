Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :pictures do
    collection do
      post :confirm
    end
  end
  
  resources :users 
  root to: 'users#new'
  
  resources :favorites, only: [:index, :create, :destroy]
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
 end
 