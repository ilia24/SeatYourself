class Timeslot < ApplicationRecord
  belongs_to :restaurant
  belongs_to :reservation

  def initialize(opentime, closetime, capacity)

    #this line subtracts the open hours from the closed hours to get the total amount of hours open (24 hour clock)
    @hoursopen = (closetime.strftime("%H").to_i - opentime.strftime("%H").to_i)
    return @hoursopen

    #if statement to check if theres a half hour or not


    #calculation to get total number of timeslots to make


  end

end
