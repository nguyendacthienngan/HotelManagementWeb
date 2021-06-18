class Client < ApplicationRecord
  has_many :reservations
  validates :name, length: { minimum: 2 }
  validates :email, format: { with: /.*@.*/ }
end
