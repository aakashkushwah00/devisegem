class AddExtraColumnToRoom < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :capacity, :integer
    add_column :rooms, :floor_number, :integer
  end
end
