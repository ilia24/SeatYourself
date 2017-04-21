class AddReservationIdToTimeslots < ActiveRecord::Migration[5.0]
  def change
    add_column :timeslots, :reservation_id, :integer
  end
end
