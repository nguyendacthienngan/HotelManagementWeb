class Client < ApplicationRecord
  has_many :payments
  validates :name, length: { minimum: 2 }
end
