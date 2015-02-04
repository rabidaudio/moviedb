Rails.application.routes.draw do

  get 'search' => 'movies#search'

  resources :movies do 
    get 'poster' => 'movies#poster'
    resources :viewings, shallow: true
  end

  resources :users do
    resources :viewings, shallow: true
  end

  #auth
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get]

  #static pages
  root 'static_pages#home'
  get '/privacy' => 'static_pages#privacy'

end
