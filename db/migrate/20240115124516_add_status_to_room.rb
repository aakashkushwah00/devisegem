class AddStatusToRoom < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :status, :string
  end
end
