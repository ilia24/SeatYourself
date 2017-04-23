class AddStartAndEndDatetime2ToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :start_time, :time
    add_column :reservations, :end_time, :time
  end
end
