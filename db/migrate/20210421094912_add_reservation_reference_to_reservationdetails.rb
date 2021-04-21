class AddReservationReferenceToReservationdetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservation_details, :reservation
  end
end
