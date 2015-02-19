Rails.application.routes.draw do


  resources :movies do 
    get 'poster' => 'movies#poster'
    resources :viewings, only: [:index]
    collection do
      get 'search' => 'movies#search'
    end
  end

  resources :users do
    resources :viewings, only: [:index]
  end
  resources :viewings

  #auth
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get]

  
  match 'auth/development', to: 'sessions#create_dev', via: [:get] if Rails.env.development? 

  #static pages
  root 'static_pages#home'
  get '/privacy' => 'static_pages#privacy'
  get '/about' => 'static_pages#about'

end
