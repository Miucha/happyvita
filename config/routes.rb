Rails.application.routes.draw do
  devise_for :users
  root to: 'activities#index'

  resources :bookings, only: [:edit, :update, :destroy]

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  patch 'activities/:id/cancel', to: 'activities#cancel', as: 'cancel_activity'

  resources :activities, except: :destroy do
    resources :bookings, only: [:create, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :addresses, only: [ :create ]
end
