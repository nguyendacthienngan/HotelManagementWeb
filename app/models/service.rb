class Service < ApplicationRecord
  has_many :reservation_details
  has_many :reservations, through: :reservation_details
end
