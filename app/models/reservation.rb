class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_and_belongs_to_many :timeslots

  def self.placeholder(starttime, endtime, peep)
    slots = Timeslot.where("start >= ? AND end <= ?", starttime, endtime).update_all(people: peep)
    return slots
  end

end
