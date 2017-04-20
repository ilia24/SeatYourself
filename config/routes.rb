Rails.application.routes.draw do

  resources :users, only: %i(new create)
  resources :sessions, only: %i(new create destroy)

  resources :restaurants do
    resources :reservations, only: %i(new show create edit destroy)

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
