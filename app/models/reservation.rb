class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :client
  belongs_to :employee
  belongs_to :payment
  has_many :reservation_details
  has_many :services, through: :reservation_details

  accepts_nested_attributes_for :payment
end
