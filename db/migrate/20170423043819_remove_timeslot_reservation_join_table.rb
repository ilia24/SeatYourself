class RemoveTimeslotReservationJoinTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :reservations_timeslots
  end
end
