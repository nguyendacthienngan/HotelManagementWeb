class AddClientReferenceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :client
  end
end
