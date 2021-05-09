class AddPaymentReferenceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :payment
  end
end