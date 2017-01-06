class AddCancledToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :cancled, :boolean
  end
end
