Rails.application.routes.draw do
  resources :pages
  # get 'home/index'
  # get 'tools/index'
  # get 'tools/show'
  # get 'producer_companies/index'
  # get 'producer_companies/show'

  root to: "home#index"
  resources :tools, only: %i[index show]
  resources :producer_companies, only: %i[index show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
