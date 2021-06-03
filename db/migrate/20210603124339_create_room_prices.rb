class CreateRoomPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :room_prices do |t|
      t.decimal :price
      t.integer :price_type
      t.datetime :date
      t.boolean :is_available

      t.timestamps
    end
    change_column_default :room_prices, :is_available, true

  end
end
