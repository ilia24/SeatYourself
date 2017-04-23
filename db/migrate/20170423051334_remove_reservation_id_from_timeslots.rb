class RemoveReservationIdFromTimeslots < ActiveRecord::Migration[5.0]
  def change
    remove_column :timeslots, :reservation_id, :integer
  end
end
