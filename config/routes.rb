Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get "search", to: "products#search"
  get "information", to: "pages#information"
  get "board", to: "pages#board"
  resources :products, except: :destroy do
    resources :reviews, only: :create
  end
  resources :reviews, except: :create

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
