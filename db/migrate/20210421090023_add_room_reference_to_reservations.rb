class AddRoomReferenceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :room
  end
end
