Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :flats do
    collection do
      get 'my_flats', to: "flats#my_flats"
    end
    member do
      get 'my_flat', to: "flats#my_flat"
    end
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :destroy, :update]
end
