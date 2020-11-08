Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :urls, only: [:new, :create]
  get '/:short_url', to: "urls#shorten_url", params: 'short_url', as: :shorten_url
  get '/:token/info', to: "urls#url_info", as: :url_info


  root to: "urls#new"
end
