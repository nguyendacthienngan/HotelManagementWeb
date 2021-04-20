class CreateRoomTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :room_types do |t|
      t.string :name
      t.decimal :hour_price
      t.decimal :date_price
      t.decimal :past_night_price
      t.decimal :week_price
      t.decimal :month_price
      t.decimal :add_adult_price
      t.decimal :add_child_price
      t.string :description

      t.timestamps
    end
  end
end
