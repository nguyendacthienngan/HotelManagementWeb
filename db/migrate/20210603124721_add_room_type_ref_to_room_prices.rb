class AddRoomTypeRefToRoomPrices < ActiveRecord::Migration[6.1]
  def change
    add_reference :room_prices, :room_type
  end
end
