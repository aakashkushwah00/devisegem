class CreateTransacations < ActiveRecord::Migration[7.1]
  def change
    create_table :transacations do |t|
      t.integer :amount
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
