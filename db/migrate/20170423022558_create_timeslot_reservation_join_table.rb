class CreateTimeslotReservationJoinTable < ActiveRecord::Migration[5.0]
    def change
    create_join_table :reservations, :timeslots do |t|
      t.index :reservation_id
      t.index :timeslot_id
    end
  end
end
