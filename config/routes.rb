Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/csrf_token', to: 'application#csrf_token'
  post '/save-beer/:variant', to: 'beers#create'

  root to: 'beers#index'
  
  resources :beers do
    collection do
      get :brewed
      get :tasted
      get :all
    end
  end

  get '/beer/:id', to: 'beers#show'
  delete '/beer/:id', to: 'beers#destroy'

end
