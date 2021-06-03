class RoomType < ApplicationRecord
  has_many :rooms
  has_many :room_prices
end
