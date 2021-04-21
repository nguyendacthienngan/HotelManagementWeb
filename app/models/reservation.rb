class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :client
  belongs_to :employee
  has_one :payment
  has_many :reservation_details
  has_many :services, through: :reservation_details
end
