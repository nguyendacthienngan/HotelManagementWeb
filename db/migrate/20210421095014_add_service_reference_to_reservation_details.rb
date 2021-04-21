class AddServiceReferenceToReservationDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservation_details, :service
  end
end
