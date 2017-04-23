class RemoveStartAndEndFromTimeslots < ActiveRecord::Migration[5.0]
  def change
    remove_column :timeslots, :start, :date
    remove_column :timeslots, :end, :date
  end
end
