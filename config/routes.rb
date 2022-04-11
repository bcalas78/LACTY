Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "search", to: "products#search"
  resources :products, except: :destroy do
    resources :reviews, only: :create
  end
  # resources :reviews, except: [:show, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
