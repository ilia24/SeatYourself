class AddLinksToReserve < ActiveRecord::Migration[5.0]
  def change
    add_column :reserves, :reservation_id, :integer
    add_column :reserves, :timeslot_id, :integer
  end
end
