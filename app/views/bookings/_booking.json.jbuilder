json.extract! booking, :id, :user_name, :airline_name, :journey_date, :booking_date, :booking_number, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)