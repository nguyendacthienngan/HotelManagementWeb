class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.datetime :reservation_date, null: false
      t.boolean :is_paid, null: false
      t.decimal :deposit
      t.decimal :temp_total
      t.datetime :check_out_date
      t.integer :payment_type, null: false
      t.decimal :total
      t.string :description
      t.boolean :is_cooperate_reservation
      t.timestamps
    end
    change_column_default :payments, :is_cooperate_reservation, false
  end
end
