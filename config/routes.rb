Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :flats do
    member do
      get 'my_flats', to: "flats#my_flats"
    end
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index]
end
