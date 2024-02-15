class AddDetailsToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :card_number, :integer
    add_column :payments, :expiration_date, :date
    add_column :payments, :cvv, :integer
  end
end
