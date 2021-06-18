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
  resources :order_service

  get "/room_diagram", to: "room_diagram#index"
  get "/room_diagram/quick_reserve_room", to: "room_diagram#quick_reserve_room"
  get "/room_diagram/quick_reserve_room/:room_id", to: "room_diagram#quick_reserve_room"
  post "/room_diagram", to: "room_diagram#index"

  get "/order_service", to: "order_service#index"
  post "/order_service", to: "order_service#index"

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
