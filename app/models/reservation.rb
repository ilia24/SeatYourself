class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_and_belongs_to_many :timeslots

  def self.placeholder(starttime, endtime, people, r_id)
    @slots = Timeslot.where("start >= ? AND end <= ?", starttime, endtime)
    @slots.update(people: (@slots.people + people) )
    @tsid = @slots.ids
    @tsid.each do |timeid|
      res = Reserve.new(reservation_id: r_id, timeslot_id: timeid)
      res.save(:validate => false)
    end
  end

end
