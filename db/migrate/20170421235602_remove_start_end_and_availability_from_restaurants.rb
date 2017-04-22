class RemoveStartEndAndAvailabilityFromRestaurants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :opentime, :time
    remove_column :restaurants, :closetime, :time
    remove_column :restaurants, :availability, :string
  end
end
