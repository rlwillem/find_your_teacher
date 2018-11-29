Rails.application.routes.draw do
  devise_for :users
  root to: 'teachers#index'
  resources :teachers do
    resources :appointments, only: [:new, :create]
  end
  resources :subjects, only: [:index]
  resources :appointments, only: [:index, :edit ,:update]
  get 'teach', to: "appointments#teach"
  patch 'accept/:id', to: "appointments#accept", as: :accept
  patch 'decline/:id', to: "appointments#decline", as: :decline
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

