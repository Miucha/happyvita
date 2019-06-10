Rails.application.routes.draw do
  devise_for :users
  root to: 'activities#index'

  resources :bookings, only: [:edit, :update, :destroy]
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'

  patch 'bookings/:id/mark_as_done', to: 'bookings#mark_as_done', as: 'mark_as_done'
  get 'bookings/:id/add_review', to: 'bookings#add_review', as: 'add_review'

  patch 'activities/:id/cancel', to: 'activities#cancel', as: 'cancel_activity'

  resources :activities, except: [:destroy, :new, :edit] do
    resources :bookings, only: [:create, :new]
  end
  get 'activities/:id/edit_event', to: 'activities#edit_event', as: 'edit_event'
  get 'activities/:id/edit_challenge', to: 'activities#edit_challenge', as: 'edit_challenge'

  resources :activity_interest, only: :create, as: 'activity_interests'

  get 'new_event', to: 'activities#new_event'
  get 'new_challenge', to: 'activities#new_challenge'

  get 'users_localization', to: 'users#index'
  get 'users', to: 'users#profile', as: 'users_profile'
  get 'users/:id/edit_profile', to: 'users#edit_profile', as: 'edit_users_profile'
  patch 'users/:id/update_profile', to: 'users#update_profile', as: 'update_users_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :addresses, only: :create


end
