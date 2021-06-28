class Payment < ApplicationRecord
  has_many :reservations
  belongs_to :client
  accepts_nested_attributes_for :client
end
