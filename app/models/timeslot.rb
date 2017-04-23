class Timeslot < ApplicationRecord
  belongs_to :restaurant
  has_and_belongs_to_many :reservations


  def initialize(attributes={})
    super
  end

  def self.create(opentime, closetime, capacity, restaurant_id)

    #this line subtracts the open hours from the closed hours to get the total amount of hours open (24 hour clock)
    timeslots = (closetime.strftime("%H").to_i - opentime.strftime("%H").to_i) * 2


    #these two if statements add/remove a timeslot depending on whether the restaurant opens on a half-hour
    if closetime.strftime("%M").to_i == 30
      timeslots += 1
    end
    if opentime.strftime("%M").to_i == 30
      timeslots -= 1
    end

    #these two lines set the 30 minute gap
    timeslot_initial_time = opentime
    timeslot_end_time = opentime + 1800

    #this do box will create the proper number of timeslots to fill the time, each with their own starting/ending time and capacity.
    timeslots.times do
      a = Timeslot.new(start: timeslot_initial_time, end: timeslot_end_time, cap: capacity, people: 0, restaurant_id: restaurant_id)
      a.save(:validate => false)
      timeslot_initial_time += 1800
      timeslot_end_time += 1800
    end
  end
end
