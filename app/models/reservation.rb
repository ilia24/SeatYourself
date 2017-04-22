class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :timeslots
end
