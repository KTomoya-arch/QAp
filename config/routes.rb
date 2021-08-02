Rails.application.routes.draw do
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
  end
 
 root to: 'questions#index'
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 
 resources :users

 resources :questions do
  collection do
    get 'search'
  end
  resources :answers, only: [:create]
 end

  namespace :admin do
    resources :questions
  end

  namespace :admin do
    resources :users
  end

  delete '/logout', to: 'sessions#destroy'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
