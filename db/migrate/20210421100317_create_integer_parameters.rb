class CreateIntegerParameters < ActiveRecord::Migration[6.1]
  def change
    create_table :integer_parameters do |t|
      t.string :param_name
      t.integer :param_value

      t.timestamps
    end
  end
end
