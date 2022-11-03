Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pets do
    resources :bookings, only: [:create, :new, :index]
  end
  resources :bookings, only: :destroy

  # Bookings of current User
  # Pets of current user
  get "dashboard/:id", to: "pages#dashboard", as: :dashboard
  get "map/", to: "pages#map", as: :map
end
