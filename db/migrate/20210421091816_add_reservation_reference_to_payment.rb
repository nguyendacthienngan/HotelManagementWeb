class AddReservationReferenceToPayment < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :reservation
  end
end
