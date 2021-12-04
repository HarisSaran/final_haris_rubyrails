Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'home/index'
  # get 'tools/index'
  # get 'tools/show'
  # get 'producer_companies/index'
  # get 'producer_companies/show'
  resources :pages, except: [:show]
  get "pages/:permalink" => "pages#permalink", as: "permalink" # using in ruby is : permalink_path

  root to: "home#index"
  resources :tools, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :producer_companies, only: %i[index show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cart, only: %i[create destroy]

  # devise_for :accounts, controllers: { registrations: "accounts/registrations" }
end
