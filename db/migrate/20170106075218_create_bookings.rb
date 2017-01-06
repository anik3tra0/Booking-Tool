class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :user_name
      t.string :airline_name
      t.date :journey_date
      t.date :booking_date
      t.string :booking_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
