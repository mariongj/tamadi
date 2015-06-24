Rails.application.routes.draw do
  devise_for :users
  # root to: "home#index"

  resources :flats do
    member do
      get 'my_flats', to: "flats#my_flats"
    end
  end

  # get 'flats/index'

  # get 'flats/show'

  # get 'flats/new'

  # get 'flats/create'

  # get 'flats/edit'

  # get 'flats/update'

  # get 'flats/delete'


  root to: "pages#home"
  resources :bookings
end
