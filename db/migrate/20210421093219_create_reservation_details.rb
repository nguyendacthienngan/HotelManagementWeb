class CreateReservationDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_details do |t|
      t.datetime :date_charged, null: false
      t.integer :quantity, null: false
      t.decimal :total, null: false

      t.timestamps
    end
  end
end
