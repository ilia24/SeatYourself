class Timeslot < ApplicationRecord
  belongs_to :restaurant
  belongs_to :reservation


def initialize(opentime, closetime, capacity)
  @start = opentime
  @end = closetime
  @cap = capacity
end

#this method will take an input of an opentime, closetime, and capacity and instantiate 30 minute instances of timeslot to full that gap

def self.create(opentime, closetime, capacity)

  #this line subtracts the open hours from the closed hours to get the total amount of hours open (24 hour clock)
  timeslots = (closetime.strftime("%H").to_i - opentime.strftime("%H").to_i) * 2


  #these two if statements add/remove a timeslot depending on whether the restaurant opens on a half-hour
  if closetime.strftime("%M").to_i == 30
    timeslots += 1
  end

  if opentime.strftime("%M").to_i == 30
    timeslots -= 1
  end

  #this do box will create the proper number of timeslots to fill the time, each with their own starting/ending time and capacity.
  timeslots.times do
    Timeslot.new(opentime, closetime, capacity)
  end
end


end

end
