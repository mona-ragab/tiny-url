Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :urls, only: [:new, :create]
  get '/info/:token/(:suffix)', to: "urls#url_info", as: :url_info
  get '/:token/(:suffix)', to: "urls#shorten_url", as: :shorten_url
  get '/api/v1/:token/(:suffix)', to: "api/urls#show"
  
  root to: "urls#new"
end
