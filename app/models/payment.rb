class Payment < ApplicationRecord

  has_many :reservations
  belongs_to :client
  # attr_accessible :reservations_attributes

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :reservations
end
