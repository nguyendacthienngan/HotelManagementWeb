class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :status, null: false
      t.datetime :arrival_date, null: false
      t.datetime :leave_date, null: false
      t.datetime :check_in_date, null: false
      t.decimal :total

      t.timestamps
    end
  end
end
