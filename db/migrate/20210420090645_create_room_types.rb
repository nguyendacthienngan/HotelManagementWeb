class CreateRoomTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :room_types do |t|
      t.string :name, null: false
      t.decimal :hour_price, null: false
      t.decimal :date_price, null: false
      t.decimal :past_night_price, null: false
      t.decimal :week_price, null: false
      t.decimal :month_price, null: false
      t.decimal :add_adult_price, null: false
      t.decimal :add_child_price, null: false
      t.string :description

      t.timestamps
    end
  end
end
