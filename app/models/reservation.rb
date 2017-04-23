class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :reserves
  has_many :timeslots, through: :reserves



  #this base method can find timeslots based on start and end time, and adds people to them
  #R_ID IS TEMP PLACEHOLDER METHOD FOR RESERVATION ID
  def self.placeholder(starttime, endtime, people, r_id)
    @slots = []
    @slots << Timeslot.where("start >= ? AND end <= ?", starttime, endtime)
    @slots.each do |i|
      i.update(people: people)
      # tsid = i.id
      # return tsid
      # reservations_timeslots.create(reservation_id: r_id, timeslot_id: tsid)
    end
    return @slots

  end

end
