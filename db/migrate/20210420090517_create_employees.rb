class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :type
      t.string :citizen_id
      t.boolean :isFemale
      t.string :nationality
      t.datetime :date_of_birth
      t.string :email
      t.integer :status

      t.timestamps
    end
  end
end
