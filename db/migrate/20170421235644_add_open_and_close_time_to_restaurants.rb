class AddOpenAndCloseTimeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :opentime, :time
    add_column :restaurants, :closetime, :time
  end
end
