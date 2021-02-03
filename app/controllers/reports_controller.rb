class ReportsController < ApplicationController
  require 'csv'
  def index
    CSV.open('reports.csv', 'w') do |csv|
      csv << ["Movie", "Theater", "Show Time", "Seat No", "Booked By"]
      Booking.includes(:seats).each do |b|
        screening = b.screening
        csv << [
                screening.movie.name,
                screening.theatre.name,
                screening.start_at.strftime('%H:%M %P'),
                b.seats.pluck(:seat_number).join(', '),
                b.user.name
              ]
      end
    end
    send_file 'reports.csv', type: 'text/csv', disposition: 'inline'
    # respond_to do |format|
    #   format.csv { send_file 'reports.csv', type: 'text/csv', disposition: 'inline' }
    # end
  end
end