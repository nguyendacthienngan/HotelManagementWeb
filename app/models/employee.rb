class Employee < ApplicationRecord
  has_many :reservations;
  validates :name, length: { minimum: 2 }, uniqueness: true
  validates :email, format: { with: /.*@.*/ }
end
