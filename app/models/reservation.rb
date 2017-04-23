class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_and_belongs_to_many :timeslots



  #this base method can find timeslots based on start and end time, and adds people to them
  #R_ID IS TEMP PLACEHOLDER METHOD FOR RESERVATION ID
  #THIS METHOD IS FUNCTIONAL BUT NEEDS TO BE PLUGGED INTO OUR FULL SYSTEM.
  def self.placeholder(starttime, endtime, people, r_id)
    @slots = Timeslot.where("start >= ? AND end <= ?", starttime, endtime)
    @slots.update(people: people)
    @tsid = @slots.ids
    @tsid.each do |timeid|
      res = Reserve.new(reservation_id: r_id, timeslot_id: timeid)
      res.save(:validate => false)
    end
  end

end
