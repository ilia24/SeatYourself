class RemoveStartAndEndTimeFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :start_time, :date
    remove_column :reservations, :end_time, :date
  end
end
