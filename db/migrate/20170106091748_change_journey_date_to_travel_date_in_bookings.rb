class ChangeJourneyDateToTravelDateInBookings < ActiveRecord::Migration
  def change
  	rename_column :bookings, :journey_date, :travel_date
  end
end
