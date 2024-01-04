class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.integer :salary
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
