class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :status, null: false
      t.integer :floor, null: false
      t.string :description
      t.string :name, null: false
      t.timestamps
    end
  end
end
