class AddDescriptionToHotel < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :description, :string
  end
end
