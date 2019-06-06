Rails.application.routes.draw do
  devise_for :users
  root to: 'activities#index'

  resources :bookings, only: [:edit, :update, :destroy]
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  patch 'activities/:id/cancel', to: 'activities#cancel', as: 'cancel_activity'

  resources :activities, except: [:destroy, :new, :edit] do
    resources :bookings, only: [:create, :new]
  end
  get 'activities/:id/edit_event', to: 'activities#edit_event', as: 'edit_event'
  get 'activities/:id/edit_challenge', to: 'activities#edit_challenge', as: 'edit_challenge'

  get 'new_event', to: 'activities#new_event'
  get 'new_challenge', to: 'activities#new_challenge'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :addresses, only: [:new, :create]

end
