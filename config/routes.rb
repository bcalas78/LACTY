Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'search', to: "products#search"
  resources :products, only: [:new, :show, :create, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
