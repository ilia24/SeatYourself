class AddStartAndEndDateTimeToTimeslots < ActiveRecord::Migration[5.0]
  def change
    add_column :timeslots, :start, :datetime
    add_column :timeslots, :end, :datetime
  end
end
