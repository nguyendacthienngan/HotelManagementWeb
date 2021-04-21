class AddEmployeeReferenceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :employee
  end
end
