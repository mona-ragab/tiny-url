Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :urls, only: [:new, :create]
  get '/:token/', to: "urls#shorten_url", params: 'token', as: :shorten_url
  get '/:token/info', to: "urls#url_info", as: :url_info


  root to: "urls#new"
end
