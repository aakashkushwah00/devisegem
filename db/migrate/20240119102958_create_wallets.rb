class CreateWallets < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.string :total_balance
      t.string :available_balance
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
