class RemoveIndex < ActiveRecord::Migration[5.0]
  def change
  end
  remove_index :reserves, [:reservation_id, :timeslot_id]
end
