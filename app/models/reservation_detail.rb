class ReservationDetail < ApplicationRecord
  belongs_to :reservation
  belongs_to :service
end
