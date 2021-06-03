class AddEmployeeRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :employee
  end
end
