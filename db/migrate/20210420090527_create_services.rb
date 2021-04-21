class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.decimal :unit_price, null: false
      t.string :description
      t.integer :status, null: false

      t.timestamps
    end
  end
end
