class RemoveStartAndEndTime2FromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :start_time, :datetime
    remove_column :reservations, :end_time, :datetime
  end
end
