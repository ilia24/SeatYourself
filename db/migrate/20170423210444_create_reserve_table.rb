class CreateReserveTable < ActiveRecord::Migration[5.0]
  def change
    create_table :reserves do |t|
      t.integer :reservation_id
      t.integer :timeslot_id
    end

    add_index :reserves, [:reservation_id, :timeslot_id]
  end
end
