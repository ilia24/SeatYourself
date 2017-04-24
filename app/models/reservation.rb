class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_and_belongs_to_many :timeslots
  validates :date, :start_time, :end_time, :group_size, presence: true

  def placeholder(starttime, endtime, group_size, restaurant_id)
    @slots = Timeslot.where("start >= ? AND end <= ? AND restaurant_id = ?", starttime, endtime, restaurant_id)
    if @slots.select { |slot| (slot.people + group_size) > slot.cap} == [].empty
      @slots.each { |slot| slot.update(people: slot.people + group_size)}

    else
      return false
    end

    # @slots.each do |slot|
    #   if (slot.people + group_size) > slot.cap
    #   return false
    #   end
    # end

    @slots.each { |slot| slot.update(people: slot.people + group_size) }

  end

end
