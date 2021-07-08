class Employee < ApplicationRecord
  has_many :reservations
  has_many :users
  accepts_nested_attributes_for :users
  validates :name, length: { minimum: 2 }
  validates :email, presence: true
  validates :citizen_id, presence: true

end
