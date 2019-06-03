Rails.application.routes.draw do
  devise_for :users
  root to: 'activities#index'

  resources :bookings, only: [:update, :destroy]

  resources :activities, except: :destroy do
    resources :bookings, only: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :addresses, only: [ :create ]

end
