class AddClientReferenceToPayments < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :client
  end
end
