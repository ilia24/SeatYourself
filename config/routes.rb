Rails.application.routes.draw do


  root 'home#index'


  resources :users, only: %i(new create)
  resources :sessions, only: %i(new create destroy)

  resources :restaurants do
    resources :reservations, only: %i(new show create edit update destroy)

    resources :reviews, only: %i(show create destroy)


  end

end
