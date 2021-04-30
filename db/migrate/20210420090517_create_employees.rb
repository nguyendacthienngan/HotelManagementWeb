class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.integer :employee_type
      t.string :citizen_id, null: false
      t.integer :gender
      t.string :nationality
      t.datetime :date_of_birth
      t.string :email
      t.integer :status, null: false
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
