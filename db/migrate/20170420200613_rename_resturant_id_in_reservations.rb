class RenameResturantIdInReservations < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :resturant_id, :restaurant_id
  end
end
