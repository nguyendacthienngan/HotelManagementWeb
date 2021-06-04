class CreateRoomTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :room_types do |t|
      t.string :name, null: false
      t.string :description
      t.integer :beds, null: false
      t.integer :available_rooms, null: false
      t.timestamps
    end
    change_column_default :room_types, :available_rooms, 0
    change_column_default :room_types, :beds, 0

  end
end
