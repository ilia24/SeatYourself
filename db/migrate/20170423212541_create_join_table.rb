class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :reservations, :timeslots do |t|
      t.index [:reservation_id, :timeslot_id]
      t.index [:timeslot_id, :reservation_id]
    end
  end
end
