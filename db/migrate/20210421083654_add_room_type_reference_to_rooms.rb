class AddRoomTypeReferenceToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :room_type
  end
end
