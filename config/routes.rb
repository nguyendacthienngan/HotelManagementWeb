Rails.application.routes.draw do
  resources :payments
  resources :reservations
  resources :rooms
  resources :room_types
  resources :services
  resources :employees
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
