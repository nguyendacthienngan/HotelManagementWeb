class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :beds, null: false
      t.integer :status, null: false
      t.integer :floor, null: false
      t.integer :capacity
      t.decimal :price, null: false
      t.string :description

      t.timestamps
    end
  end
end
