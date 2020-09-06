Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get "ratings" => "ratings#index", as: "ratings"
  #resources :ajax, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  resources :series
  resources :users do
  	resources :ratings
  end
  resources :ratings
  resources :tvratings

  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'ajax#index'

end
