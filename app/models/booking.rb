class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :screening
  has_many :seats, dependent: :destroy
end
