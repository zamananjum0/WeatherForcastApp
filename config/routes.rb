Rails.application.routes.draw do
  root 'weathers#index'

  get 'cities/search' => 'cities#search'
  post '/weathers/search' => 'weathers#index', as: :search_weather
  get '/weathers/search' => 'weathers#index'
end
