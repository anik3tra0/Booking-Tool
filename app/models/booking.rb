class Booking < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :user_name, :airline_name, :travel_date, :booking_date, :booking_number
	validates_length_of :booking_number, is: 6
	validates_uniqueness_of :booking_number

	after_create :remove_old_bookings

	def remove_old_bookings
		Booking.where('booking_date < ?', Date.today - 2.years).delete_all
		Booking.where('cancled == ? and booking_date < ?', true, Date.today - 3.months )
	end



	def self.generate_booking_number		
		user_defined_numbers = ["SELFIE", "BARNEY", "RACHEL", "MONICA", "AMAZON"]
		book_number = generate_number
		while true
			if user_defined_numbers.find {|a| a == book_number}
				book_number = generate_number
			elsif Booking.all.pluck(:booking_number).find {|a| a == book_number}
				book_number = generate_number
			else					
				break
			end
		end
		return book_number
	end

	def self.generate_first_three_numbers
		return Array.new(3){rand(10..35).to_s(36)}.join.upcase
	end

	def self.generate_last_three_numbers
		return Array.new(3){rand(36).to_s(36)}.join.upcase
	end

	def self.generate_number
		first_three = generate_first_three_numbers
		while true
			if first_three == "EKA"
				first_three = generate_first_three_numbers
			elsif Booking.last.booking_number.include? first_three
				first_three = generate_first_three_numbers
			else
				break
			end
		end
		last_three = generate_last_three_numbers
		return first_three + last_three
	end

end
