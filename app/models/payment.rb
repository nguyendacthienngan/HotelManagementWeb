class Payment < ApplicationRecord
  has_many :reservations
end
