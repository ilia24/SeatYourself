class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_and_belongs_to_many :timeslots
  validates :date, :start_time, :end_time, :group_size, presence: true

  def placeholder(reservation)
    start_time = match_date(reservation,reservation.start_time)
    end_time = match_date(reservation,reservation.end_time)
    slots = Timeslot.where("start >= ? AND end <= ? AND restaurant_id = ?", start_time, end_time, reservation.restaurant_id)
    if !slots.empty? && slots.select { |slot| (slot.people + group_size) > slot.cap}.empty?
      slots.each { |slot| slot.update(people: slot.people + group_size)}
    else
      return false
    end

  end

  def edit_reserve(reservation,reservation_edit)

    old_start_time = match_date(reservation,reservation.start_time)
    old_end_time   = match_date(reservation,reservation.end_time)
    new_start_time = match_date(reservation_edit,reservation_edit.start_time)
    new_end_time   = match_date(reservation_edit,reservation_edit.end_time)
    old_reserv = [old_start_time, old_end_time, reservation.date, reservation.group_size]
    new_reserv = [new_start_time, new_end_time, reservation_edit.date, reservation_edit.group_size ]
    byebug
    i = 0
    number_of_edit = 4
    while i < 4
      if new_reserv[i] == nil
        new_reserv[i] = old_reserv[i]
        number_of_edit -= 1
      end
      i += 1
    end

    if number_of_edit == 0
      return false
    end

    old_slots = Timeslot.where("start >= ? AND end <= ? AND restaurant_id = ?", old_start_time, old_end_time, reservation.restaurant_id)
    new_slots = Timeslot.where("start >= ? AND end <= ? AND restaurant_id = ?", new_start_time, new_end_time, reservation.restaurant_id)
    byebug
    if !new_slots.empty? && new_slots.select { |slot| (slot.people + reservation_edit.group_size) > slot.cap}.empty?
      old_slots.each { |slot| slot.update(people: slot.people - reservation.group_size)}
      new_slots.each { |slot| slot.update(people: slot.people + group_size)}
    else
      return false
    end
  end

  def match_date(reservation,time)
    matched_date_time = time.change(year: reservation.date.year, month: reservation.date.month, day: reservation.date.day )
  end


end
