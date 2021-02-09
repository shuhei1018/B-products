Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "products#index"
  get 'products/search'
  resources :products do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
