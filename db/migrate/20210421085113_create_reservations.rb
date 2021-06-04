class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :status, null: false
      t.datetime :arrival_date, null: false
      t.datetime :leave_date, null: false
      t.datetime :check_in_date, null: false
      t.decimal :total
      t.string :client_name, null: false
      t.string :client_citizen_id, null:false
      t.integer :children, null:false
      t.integer :adults, null:false
      t.string :description
      t.timestamps
    end
    change_column_default :reservations, :adults, 0
    change_column_default :reservations, :children, 0
    change_column_default :reservations, :status, 0
  end
end
