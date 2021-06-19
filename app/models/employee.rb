class Employee < ApplicationRecord
  has_many :reservations
  has_many :users
  accepts_nested_attributes_for :users
  validates :name, length: { minimum: 2 }
end
