class AddIndex < ActiveRecord::Migration[5.0]
  def change
  end

  add_index :reserves, [:reservation_id, :timeslot_id]
end
