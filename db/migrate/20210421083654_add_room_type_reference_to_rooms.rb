class AddRoomTypeReferenceToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :roomType
  end
end
