Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/csrf_token', to: 'application#csrf_token'


  get '/all-beers', to: 'beers#index'

  post '/save-beer/:variant', to: 'beers#create'
  
  resources :brewed_beers

  # url path  ---  controller#action

  get '/brewed-beers', to: 'brewed_beers#index'
  get '/tasted-beers', to: 'tasted_beers#index'



  
end
