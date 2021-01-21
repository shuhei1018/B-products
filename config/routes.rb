Rails.application.routes.draw do
  devise_for :users
  resources :products, only: :index
  root to: "products#index"
  post '/products/guest_sign_in', to: 'products#new_guest'
end
