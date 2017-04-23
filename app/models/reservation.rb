class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_and_belongs_to_many :timeslots
end
