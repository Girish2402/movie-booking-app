class Seat < ApplicationRecord
  belongs_to :booking

  scope :booked_seat_for_screen, lambda {|screen_id|
    select(:seat_number).where(screening_id: screen_id).map(&:seat_number)
  }

end
