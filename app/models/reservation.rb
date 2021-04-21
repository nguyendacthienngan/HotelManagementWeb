class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :client
  belongs_to :employee
  has_one :reservation
end
