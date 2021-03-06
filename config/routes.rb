Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: 'search#index'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :parks, only: [:show, :index]
end
