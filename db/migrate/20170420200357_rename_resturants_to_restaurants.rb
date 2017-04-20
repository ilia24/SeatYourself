class RenameResturantsToRestaurants < ActiveRecord::Migration[5.0]
  def change
    rename_table :resturants, :restaurants
  end
end
