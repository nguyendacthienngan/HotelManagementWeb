Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :integer_parameters
  resources :reservation_details
  resources :payments
  resources :reservations
  resources :rooms
  resources :room_types
  resources :services
  resources :employees
  resources :clients
  resources :room_prices

  get "/room_diagram", to: "room_diagram#index"
  post "/room_diagram", to: "room_diagram#index"

  get "/room_diagram/quick_reserve_room", to: "room_diagram#quick_reserve_room"
  get "/room_diagram/quick_reserve_room/:room_id", to: "room_diagram#quick_reserve_room"

  get "/room_diagram/room_info/", to: "room_diagram#room_info"
  get "/room_diagram/room_info/:room_id", to: "room_diagram#room_info"

  get "/individual_reservation", to: "individual_reservation#index"
  get "/individual_reservation/:reservation_id", to: "individual_reservation#show"
  get "/individual_reservation/new/:room_id", to: "individual_reservation#new"

  get "/cooperate_reservation", to: "cooperate_reservation#index"

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
