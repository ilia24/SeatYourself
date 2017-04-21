class AddStartAndEndTimeToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :start_time, :date
    add_column :reservations, :end_time, :date
  end
end
