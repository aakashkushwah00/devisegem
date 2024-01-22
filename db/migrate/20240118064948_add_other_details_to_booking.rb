class AddOtherDetailsToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :name, :string
    add_column :bookings, :email, :string
    add_column :bookings, :contact_number, :integer
  end
end
