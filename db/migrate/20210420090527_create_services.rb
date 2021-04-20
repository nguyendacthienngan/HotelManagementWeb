class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.decimal :unit_price
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
