Rails.application.routes.draw do
  devise_for :users
  resources :products, only: :index
  root to: "products#index"
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
