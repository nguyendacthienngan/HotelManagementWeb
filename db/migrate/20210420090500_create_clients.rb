class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :citizen_id, null: false
      t.boolean :is_female
      t.string :nationality
      t.datetime :date_of_birth
      t.string :email
      t.integer :type

      t.timestamps
    end
  end
end
