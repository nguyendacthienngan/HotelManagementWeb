Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :integer_parameters
  resources :reservation_details
  resources :payments
  get "/reservations/new/", to: "reservations#new"
  get "/reservations/new/:room_id", to: "reservations#new"
  post "/reservations/new/:room_id", to: "reservations#new"

  put "/reservations/:id/change_status", to: "reservations#change_status"
  resources :reservations,except: :new
  resources :rooms
  resources :room_types
  resources :services
  resources :employees
  resources :clients
  resources :room_prices
  resources :order_service

  get "/room_diagram", to: "room_diagram#index"
  post "/room_diagram", to: "room_diagram#index"

  get "/room_diagram/quick_reserve_room", to: "room_diagram#quick_reserve_room"
  get "/room_diagram/quick_reserve_room/:room_id/", to: "room_diagram#quick_reserve_room"
  get "/room_diagram/room_info/", to: "room_diagram#room_info"
  get "/room_diagram/room_info/:room_id", to: "room_diagram#room_info"

  get "/cooperate_reservation", to: "cooperate_reservation#index"

  get "/cooperate_reservation/choose_rooms", to: "cooperate_reservation#choose_rooms"
  get "/cooperate_reservation/:reservation_id", to: "cooperate_reservation#show"

  get "/cooperate_reservation/new/:room_id", to: "cooperate_reservation#new"
    post "/cooperate_reservation/new/", to: "cooperate_reservation#create"
  resources :cooperate_reservation

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
