class BookingsController < ApplicationController
	def new
		@screening = Screening.find(params[:screening_id])
		@booked_seats = Seat.booked_seat_for_screen(@screening.id)
	end

	def create
		@booking = Booking.new(
									user_id: current_user.id,
									screening_id: params[:screening_id]
								)
		if @booking.save
			seats = JSON.parse params[:seats]
			seats.each do |number|
				@booking.seats.create!(seat_number: number, screening_id: params[:screening_id])
			end
      flash[:notice] = "Booking created successfully!"
      redirect_to root_path
    else
      flash.now.alert = "Oops, couldn't create booking now."
      render :new
    end
	end

end